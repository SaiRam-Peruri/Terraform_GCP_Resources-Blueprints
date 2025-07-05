# Cloud Functions

## Overview
Creates Google Cloud Functions for serverless compute workloads, providing event-driven execution without server management. Supports both HTTP triggers and event-based triggers.

## Deployed Resources
- **Cloud Function:** `demo-function`
  - **Runtime:** Python 3.9
  - **Trigger:** HTTP trigger (public access)
  - **Memory:** 256MB
  - **Timeout:** 60 seconds
  - **Source:** ZIP archive from Cloud Storage
  - **Entry Point:** `hello_world`

## Function Configuration

### Runtime Settings
- **Memory Allocation:** 256MB (suitable for lightweight tasks)
- **Timeout:** 60 seconds maximum execution time
- **Runtime:** Python 3.9 (latest supported)
- **Maximum Instances:** 1000 (auto-scaling limit)
- **Environment Variables:** Configurable via terraform.tfvars

### Source Code
```python
# main.py example
import functions_framework
import json

@functions_framework.http
def hello_world(request):
    """HTTP Cloud Function entry point."""
    
    # Handle CORS for web requests
    if request.method == 'OPTIONS':
        headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Max-Age': '3600'
        }
        return ('', 204, headers)
    
    # Set CORS headers for main request
    headers = {'Access-Control-Allow-Origin': '*'}
    
    try:
        # Get request data
        request_json = request.get_json(silent=True)
        name = request_json.get('name', 'World') if request_json else 'World'
        
        # Business logic
        response = {
            'message': f'Hello, {name}!',
            'timestamp': str(datetime.utcnow()),
            'method': request.method
        }
        
        return (json.dumps(response), 200, headers)
        
    except Exception as e:
        error_response = {'error': str(e)}
        return (json.dumps(error_response), 500, headers)
```

## Usage Examples

### Invoke Function via HTTP
```bash
# Get function URL
gcloud functions describe demo-function --region=us-central1 --format="value(httpsTrigger.url)"

# Test with curl
curl -X POST "https://us-central1-PROJECT_ID.cloudfunctions.net/demo-function" \
     -H "Content-Type: application/json" \
     -d '{"name": "Cloud Function"}'

# Test with gcloud
gcloud functions call demo-function \
    --region=us-central1 \
    --data='{"name": "Test"}'
```

### Deploy Function Updates
```bash
# Package source code
zip -r function-source.zip main.py requirements.txt

# Upload to staging bucket
gsutil cp function-source.zip gs://demo-bucket-PROJECT_ID/function-source.zip

# Update function source (Terraform will handle this)
terraform apply -target=module.serverless.google_cloudfunctions_function.function
```

### Environment Variables
```bash
# Set environment variables
gcloud functions deploy demo-function \
    --runtime=python39 \
    --trigger=http \
    --entry-point=hello_world \
    --set-env-vars="API_KEY=your-secret-key,DEBUG=false"

# View current environment variables
gcloud functions describe demo-function --region=us-central1 --format="value(environmentVariables)"
```

## Event-Driven Triggers

### Pub/Sub Trigger Example
```python
# pubsub_function.py
import base64
import json
from google.cloud import storage

@functions_framework.cloud_event
def process_message(cloud_event):
    """Triggered by Pub/Sub message."""
    
    # Decode Pub/Sub message
    message_data = base64.b64decode(cloud_event.data["message"]["data"])
    message_json = json.loads(message_data.decode('utf-8'))
    
    print(f"Processing message: {message_json}")
    
    # Example: Process file upload notification
    if message_json.get('eventType') == 'object.finalize':
        bucket_name = message_json['bucketId']
        file_name = message_json['objectId']
        
        # Process the uploaded file
        process_uploaded_file(bucket_name, file_name)
    
    return 'OK'

def process_uploaded_file(bucket_name, file_name):
    """Process uploaded file from Cloud Storage."""
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(file_name)
    
    # Download and process file
    content = blob.download_as_text()
    print(f"Processing file {file_name}: {len(content)} characters")
```

### Storage Trigger
```hcl
# terraform configuration for storage trigger
resource "google_cloudfunctions_function" "storage_function" {
  name        = "process-uploads"
  runtime     = "python39"
  entry_point = "process_file"
  
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.upload_bucket.name
  }
  
  source_archive_bucket = google_storage_bucket.source_bucket.name
  source_archive_object = google_storage_bucket_object.function_source.name
}
```

## Security and Access Control

### IAM Configuration
```bash
# Grant function invoker role to specific user
gcloud functions add-iam-policy-binding demo-function \
    --member="user:user@example.com" \
    --role="roles/cloudfunctions.invoker" \
    --region=us-central1

# Grant access to service account
gcloud functions add-iam-policy-binding demo-function \
    --member="serviceAccount:app@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudfunctions.invoker" \
    --region=us-central1

# Make function publicly accessible (use with caution)
gcloud functions add-iam-policy-binding demo-function \
    --member="allUsers" \
    --role="roles/cloudfunctions.invoker" \
    --region=us-central1
```

### Private Functions
```hcl
# Private function configuration
resource "google_cloudfunctions_function" "private_function" {
  name                  = "private-function"
  runtime              = "python39"
  entry_point          = "main"
  ingress_settings     = "ALLOW_INTERNAL_ONLY"
  
  # VPC connector for private access
  vpc_connector = "projects/PROJECT_ID/locations/us-central1/connectors/demo-connector"
}
```

## Monitoring and Logging

### Function Metrics
- **Invocations:** Total function calls
- **Duration:** Execution time per invocation
- **Memory Usage:** Peak memory consumption
- **Errors:** Function execution failures
- **Cold Starts:** New instance initialization time

### Log Analysis
```bash
# View function logs
gcloud functions logs read demo-function --region=us-central1 --limit=50

# View logs with specific severity
gcloud functions logs read demo-function \
    --region=us-central1 \
    --severity=ERROR \
    --limit=20

# Stream logs in real-time
gcloud functions logs tail demo-function --region=us-central1
```

### Custom Monitoring
```python
# monitoring.py - Add to function
from google.cloud import monitoring_v3

def report_custom_metric(value):
    """Report custom metric to Cloud Monitoring."""
    client = monitoring_v3.MetricServiceClient()
    project_name = f"projects/{PROJECT_ID}"
    
    series = monitoring_v3.TimeSeries()
    series.metric.type = "custom.googleapis.com/function/processing_time"
    series.resource.type = "cloud_function"
    series.resource.labels["function_name"] = "demo-function"
    series.resource.labels["region"] = "us-central1"
    
    point = series.points.add()
    point.value.double_value = value
    point.interval.end_time.seconds = int(time.time())
    
    client.create_time_series(name=project_name, time_series=[series])
```

## Performance Optimization

### Cold Start Reduction
```python
# Global variables for connection reuse
import os
from google.cloud import storage

# Initialize outside function handler
storage_client = storage.Client()
database_connection = None

@functions_framework.http
def optimized_function(request):
    """Function with optimized cold start."""
    global database_connection
    
    # Reuse connections
    if database_connection is None:
        database_connection = initialize_database()
    
    # Function logic here
    return process_request(request)
```

### Memory and Timeout Tuning
```bash
# Update function configuration
gcloud functions deploy demo-function \
    --memory=512MB \
    --timeout=300s \
    --max-instances=100 \
    --runtime=python39
```

## Error Handling and Retry

### Retry Configuration
```hcl
resource "google_cloudfunctions_function" "retry_function" {
  name        = "reliable-function"
  runtime     = "python39"
  entry_point = "main"
  
  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource   = google_pubsub_topic.trigger.name
    
    failure_policy {
      retry = true
    }
  }
}
```

### Error Handling Best Practices
```python
import logging
import traceback
from google.cloud import error_reporting

# Initialize error reporting
error_client = error_reporting.Client()

@functions_framework.http
def robust_function(request):
    """Function with comprehensive error handling."""
    try:
        # Function logic
        result = process_request(request)
        return result
        
    except ValueError as e:
        # Handle expected errors
        logging.warning(f"Invalid input: {e}")
        return ({'error': 'Invalid input'}, 400)
        
    except Exception as e:
        # Handle unexpected errors
        logging.error(f"Unexpected error: {e}")
        error_client.report_exception()
        return ({'error': 'Internal server error'}, 500)
```

## Cost Optimization

### Pricing Model
- **Invocations:** $0.40 per million invocations
- **Compute Time:** $0.0000025 per 100ms (at 256MB)
- **Memory:** Scales with allocated memory
- **Networking:** Egress charges apply

### Cost Reduction Strategies
- Right-size memory allocation based on actual usage
- Optimize function execution time
- Use connection pooling to reduce cold starts
- Implement caching for frequently accessed data
- Monitor and optimize function invocations

## Troubleshooting

### Common Issues
1. **Cold start latency:** Optimize imports and global variables
2. **Memory exceeded:** Increase memory allocation or optimize code
3. **Timeout errors:** Increase timeout or optimize performance
4. **Permission denied:** Check IAM roles and service account permissions

### Debug Techniques
```bash
# Deploy function with debugging
gcloud functions deploy debug-function \
    --runtime=python39 \
    --trigger=http \
    --entry-point=main \
    --set-env-vars="DEBUG=true,LOG_LEVEL=DEBUG"

# Test function locally
functions-framework --target=hello_world --debug
```
