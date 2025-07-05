# Cloud Storage Bucket

## Overview
Creates Google Cloud Storage buckets with production-ready configuration including versioning, lifecycle policies, and IAM settings for secure and cost-effective object storage.

## Deployed Resources
- **Main Storage Bucket:** `demo-bucket-[project-id]`
  - **Location:** US (multi-region)
  - **Storage Class:** STANDARD
  - **Versioning:** Enabled
  - **Public Access:** Prevented
  - **Uniform Bucket-Level Access:** Enabled

- **Backup Bucket:** `demo-backup-bucket-[project-id]`
  - **Location:** us-central1 (regional)
  - **Storage Class:** NEARLINE (cost-optimized for backups)
  - **Lifecycle:** Automatic archival and deletion

## Storage Classes and Use Cases

### STANDARD
- **Use Cases:** Frequently accessed data, websites, streaming
- **Availability:** 99.95% (multi-region), 99.9% (regional)
- **Minimum Storage Duration:** None

### NEARLINE
- **Use Cases:** Data accessed less than once per month
- **Availability:** 99.95% (multi-region), 99.9% (regional)
- **Minimum Storage Duration:** 30 days

### COLDLINE
- **Use Cases:** Data accessed less than once per quarter
- **Availability:** 99.95% (multi-region), 99.9% (regional)
- **Minimum Storage Duration:** 90 days

### ARCHIVE
- **Use Cases:** Long-term archive, disaster recovery
- **Availability:** 99.95% (multi-region), 99.9% (regional)
- **Minimum Storage Duration:** 365 days

## Usage Examples

### Upload and Download Files
```bash
# Upload a file
gsutil cp local-file.txt gs://demo-bucket-your-project-id/

# Upload directory recursively
gsutil -m cp -r ./local-directory gs://demo-bucket-your-project-id/

# Download a file
gsutil cp gs://demo-bucket-your-project-id/file.txt ./

# List bucket contents
gsutil ls gs://demo-bucket-your-project-id/

# Get bucket info
gsutil ls -L -b gs://demo-bucket-your-project-id/
```

### Access Control
```bash
# Grant read access to a user
gsutil iam ch user:user@example.com:objectViewer gs://demo-bucket-your-project-id

# Grant write access to a service account
gsutil iam ch serviceAccount:sa@project.iam.gserviceaccount.com:objectAdmin gs://demo-bucket-your-project-id

# View IAM policy
gsutil iam get gs://demo-bucket-your-project-id
```

## Lifecycle Management

### Configured Policies
1. **Transition to Nearline:** Objects older than 30 days
2. **Transition to Coldline:** Objects older than 90 days
3. **Transition to Archive:** Objects older than 365 days
4. **Delete:** Objects older than 7 years (2,555 days)

### Custom Lifecycle Rules
```bash
# Create lifecycle configuration
cat > lifecycle.json << EOF
{
  "rule": [
    {
      "action": {"type": "SetStorageClass", "storageClass": "NEARLINE"},
      "condition": {"age": 30}
    },
    {
      "action": {"type": "Delete"},
      "condition": {"age": 2555}
    }
  ]
}
EOF

# Apply lifecycle policy
gsutil lifecycle set lifecycle.json gs://your-bucket-name
```

## Versioning and Data Protection

### Object Versioning
- **Enabled by default** for data protection
- Previous versions retained until lifecycle policy deletes them
- Access specific versions using generation numbers

### Example Version Management
```bash
# List all versions of an object
gsutil ls -a gs://demo-bucket-your-project-id/file.txt

# Restore a previous version
gsutil cp gs://demo-bucket-your-project-id/file.txt#1234567890 gs://demo-bucket-your-project-id/file.txt

# Delete a specific version
gsutil rm gs://demo-bucket-your-project-id/file.txt#1234567890
```

## Security Configuration

### Access Controls
- **Uniform Bucket-Level Access:** Simplifies permission management
- **Public Access Prevention:** Blocks public access by default
- **IAM Integration:** Uses Cloud IAM for fine-grained access control

### Encryption
- **Default:** Google-managed encryption keys
- **Enhanced:** Customer-managed encryption keys (CMEK) via Cloud KMS
- **Custom:** Customer-supplied encryption keys (CSEK)

## Monitoring and Logging

### Key Metrics
- **Storage usage:** Total bytes stored
- **Request metrics:** GET, PUT, DELETE operations
- **Bandwidth:** Ingress and egress traffic
- **Error rates:** 4xx and 5xx responses

### Audit Logging
- All bucket operations logged to Cloud Audit Logs
- Data access logs available for compliance
- Integration with Cloud Monitoring for alerting

## Cost Optimization

### Storage Cost Reduction
- Use appropriate storage classes for access patterns
- Implement lifecycle policies for automatic transitions
- Monitor and optimize data transfer costs
- Use compression for large files

### Cost Monitoring
```bash
# Analyze storage usage by storage class
gsutil du -shc gs://demo-bucket-your-project-id

# Export billing data to BigQuery for analysis
gcloud billing accounts list
```

## Backup and Disaster Recovery

### Cross-Region Replication
- Multi-region buckets provide automatic replication
- Regional buckets can use transfer service for replication
- Configure separate backup bucket for critical data

### Data Transfer Options
- **Storage Transfer Service:** Scheduled transfers from other clouds
- **Transfer Appliance:** For large datasets (petabyte scale)
- **gsutil:** Command-line tool for smaller transfers

## Performance Optimization

### Best Practices
- Use parallel uploads for large files: `gsutil -m cp`
- Enable compression for text files
- Use appropriate request patterns (avoid hotspotting)
- Monitor transfer speeds and optimize network path

### Request Rate Limits
- **Standard:** 1,000 operations per second per prefix
- **Large objects:** Use composite uploads for >32MB files
- **Hotspotting:** Distribute objects across different prefixes
