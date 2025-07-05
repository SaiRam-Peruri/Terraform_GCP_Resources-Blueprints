# Cloud Monitoring Alert Policies

## Overview
Creates comprehensive alert policies for monitoring critical infrastructure metrics and triggering notifications when thresholds are exceeded or services become unavailable.

## Deployed Alert Policies

### 1. High CPU Usage Alert
- **Target:** Compute Engine instances
- **Condition:** CPU utilization > 80% for 5 minutes
- **Notification:** Email channel
- **Severity:** Warning

### 2. Instance Down Alert
- **Target:** Compute Engine instances
- **Condition:** Instance not responding to uptime checks
- **Notification:** Email channel  
- **Severity:** Critical

### 3. Storage Bucket Access Errors
- **Target:** Cloud Storage buckets
- **Condition:** 4xx/5xx error rate > 5% for 2 minutes
- **Notification:** Email channel
- **Severity:** Warning

## Alert Policy Configuration

### Notification Channels
- **Email Channel:** `demo-email-channel`
  - **Type:** Email notification
  - **Address:** Configured via terraform.tfvars
  - **Enabled:** True

### Condition Types

#### Metric Threshold Conditions
```hcl
# Example: CPU utilization threshold
condition {
  display_name = "High CPU Usage"
  
  condition_threshold {
    filter         = "resource.type=\"gce_instance\""
    comparison     = "COMPARISON_GREATER_THAN"
    threshold_value = 0.8
    duration       = "300s"
    
    aggregations {
      alignment_period   = "60s"
      per_series_aligner = "ALIGN_MEAN"
    }
  }
}
```

#### Uptime Check Conditions
```hcl
# Example: Uptime check failure
condition {
  display_name = "Uptime check failure"
  
  condition_absent {
    filter   = "resource.type=\"uptime_url\""
    duration = "600s"
  }
}
```

## Usage Examples

### View Active Alerts
```bash
# List all alert policies
gcloud alpha monitoring policies list --format="table(displayName,enabled,conditions[0].displayName)"

# Describe specific policy
gcloud alpha monitoring policies describe POLICY_ID

# List notification channels
gcloud alpha monitoring channels list --format="table(displayName,type,enabled)"
```

### Test Notifications
```bash
# Send test notification
gcloud alpha monitoring channels verify CHANNEL_ID

# Create test incident
gcloud alpha monitoring policies test POLICY_ID
```

### Manage Alert Policies
```bash
# Enable/disable alert policy
gcloud alpha monitoring policies update POLICY_ID --update-enabled

# Add notification channel to policy
gcloud alpha monitoring policies update POLICY_ID \
    --add-notification-channels=CHANNEL_ID
```

## Metric Filters and Aggregations

### Common Resource Types
- **GCE Instances:** `resource.type="gce_instance"`
- **Cloud SQL:** `resource.type="cloudsql_database"`
- **GKE Containers:** `resource.type="k8s_container"`
- **Cloud Functions:** `resource.type="cloud_function"`
- **Cloud Storage:** `resource.type="storage_bucket"`

### Aggregation Examples
```hcl
# CPU utilization aggregation
aggregations {
  alignment_period     = "300s"
  per_series_aligner  = "ALIGN_MEAN"
  cross_series_reducer = "REDUCE_MEAN"
  group_by_fields     = ["resource.labels.instance_id"]
}

# Error rate aggregation
aggregations {
  alignment_period     = "60s"
  per_series_aligner  = "ALIGN_RATE"
  cross_series_reducer = "REDUCE_SUM"
}
```

## Alert Policy Best Practices

### Threshold Selection
- **CPU Usage:** 80% warning, 95% critical
- **Memory Usage:** 85% warning, 95% critical
- **Disk Usage:** 80% warning, 90% critical
- **Error Rates:** 1% warning, 5% critical
- **Response Time:** 2x baseline warning, 5x baseline critical

### Duration Settings
- **Transient metrics:** 2-5 minutes
- **Persistent issues:** 5-10 minutes
- **Critical services:** 1-2 minutes
- **Batch jobs:** 15-30 minutes

### Notification Strategy
```hcl
# Multi-channel notifications
notification_channels = [
  google_monitoring_notification_channel.email.name,
  google_monitoring_notification_channel.slack.name,
  google_monitoring_notification_channel.pagerduty.name
]

# Escalation based on severity
dynamic "alert_strategy" {
  content {
    auto_close = "1800s"  # 30 minutes
    
    notification_rate_limit {
      period = "300s"  # 5 minutes between notifications
    }
  }
}
```

## Advanced Alert Configurations

### Multi-Condition Alerts
```hcl
resource "google_monitoring_alert_policy" "complex_alert" {
  display_name = "Database Performance Alert"
  combiner     = "AND"  # All conditions must be true
  
  conditions {
    display_name = "High CPU"
    condition_threshold {
      filter         = "resource.type=\"cloudsql_database\""
      comparison     = "COMPARISON_GREATER_THAN"
      threshold_value = 0.8
      duration       = "300s"
    }
  }
  
  conditions {
    display_name = "High Connection Count"
    condition_threshold {
      filter         = "resource.type=\"cloudsql_database\""
      comparison     = "COMPARISON_GREATER_THAN"
      threshold_value = 80
      duration       = "300s"
    }
  }
}
```

### Log-Based Alerts
```hcl
resource "google_monitoring_alert_policy" "error_log_alert" {
  display_name = "Application Error Alert"
  
  conditions {
    display_name = "Error log entries"
    
    condition_threshold {
      filter = "resource.type=\"cloud_function\" AND severity=\"ERROR\""
      comparison = "COMPARISON_GREATER_THAN"
      threshold_value = 5
      duration = "300s"
      
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
}
```

## Monitoring Dashboard Integration

### Create Custom Dashboard
```bash
# Export existing dashboard
gcloud monitoring dashboards list
gcloud monitoring dashboards describe DASHBOARD_ID --format="export" > dashboard.yaml

# Import dashboard
gcloud monitoring dashboards create --config-from-file=dashboard.yaml
```

### Dashboard JSON Configuration
```json
{
  "displayName": "Infrastructure Overview",
  "mosaicLayout": {
    "tiles": [
      {
        "width": 6,
        "height": 4,
        "widget": {
          "title": "CPU Utilization",
          "xyChart": {
            "dataSets": [
              {
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "filter": "resource.type=\"gce_instance\"",
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_MEAN"
                    }
                  }
                }
              }
            ]
          }
        }
      }
    ]
  }
}
```

## Alert Fatigue Prevention

### Smart Grouping
```hcl
# Group related alerts
alert_strategy {
  auto_close = "86400s"  # 24 hours
  
  notification_rate_limit {
    period = "3600s"  # 1 hour between notifications
  }
}
```

### Conditional Alerts
```hcl
# Only alert during business hours
condition_threshold {
  filter = "resource.type=\"gce_instance\" AND metric.labels.hour >= 9 AND metric.labels.hour <= 17"
  # ... other configuration
}
```

## Incident Response Workflow

### Automated Actions
```python
# Cloud Function for automated response
import logging
from google.cloud import compute_v1

def handle_alert(request):
    """Respond to monitoring alert."""
    alert_data = request.get_json()
    
    if alert_data.get('incident', {}).get('condition_name') == 'High CPU Usage':
        # Scale up instance
        instance_name = extract_instance_from_alert(alert_data)
        scale_instance(instance_name)
        
    elif 'Database' in alert_data.get('incident', {}).get('condition_name', ''):
        # Restart database connection pool
        restart_connection_pool()
    
    return 'OK'

def scale_instance(instance_name):
    """Scale up compute instance."""
    compute_client = compute_v1.InstancesClient()
    # Implementation for scaling logic
    pass
```

### Integration with External Tools
```yaml
# Terraform configuration for webhook notification
resource "google_monitoring_notification_channel" "webhook" {
  display_name = "Incident Webhook"
  type         = "webhook_tokenauth"
  
  labels = {
    url = "https://your-incident-management-system.com/webhook"
  }
  
  sensitive_labels {
    auth_token = var.incident_webhook_token
  }
}
```

## Cost Optimization

### Alert Policy Limits
- **Free tier:** 150 alert policies per project
- **Paid tier:** No additional charges for policies
- **Notification costs:** Based on channel type (email free, SMS/voice charged)

### Optimization Strategies
- Consolidate similar alerts into multi-condition policies
- Use appropriate alert durations to avoid noise
- Implement notification rate limiting
- Regular review and cleanup of unused policies

## Troubleshooting

### Common Issues
1. **Alerts not firing:** Check metric filters and thresholds
2. **Too many false positives:** Adjust thresholds or duration
3. **Missing notifications:** Verify notification channel configuration
4. **Performance impact:** Monitor alert policy evaluation costs

### Debug Alert Policies
```bash
# Check alert policy syntax
gcloud alpha monitoring policies create --policy-from-file=policy.yaml --dry-run

# View alert history
gcloud alpha monitoring policies list-incidents --policy=POLICY_ID

# Test metric filters
gcloud alpha monitoring metrics list --filter="metric.type:\"compute.googleapis.com/instance/cpu/utilization\""
```
