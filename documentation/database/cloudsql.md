# Cloud SQL Database

## Overview
Creates a fully managed Google Cloud SQL PostgreSQL instance with production-ready configuration including automated backups, high availability, and security features.

## Deployed Resources
- **Cloud SQL Instance:** `demo-postgres`
  - **Engine:** PostgreSQL 13
  - **Tier:** db-f1-micro (1 vCPU, 0.6GB RAM)
  - **Region:** us-central1
  - **Storage:** 20GB SSD with auto-resize enabled
  - **Availability:** Zonal (can be upgraded to regional)

- **Database:** `demo_db`
- **User:** `demo_user` (password managed in Secret Manager)

## Instance Configuration

### Performance Settings
- **Machine Type:** db-f1-micro (suitable for development/testing)
- **Storage Type:** SSD for better performance
- **Storage Auto-resize:** Enabled (up to 100GB)
- **Connection Limits:** Based on machine type

### High Availability
- **Backup:** Automated daily backups enabled
- **Point-in-time Recovery:** 7-day transaction log retention
- **Maintenance Window:** Sunday 4:00-5:00 AM UTC
- **Deletion Protection:** Enabled

### Security Features
- **Private IP:** Configured for VPC-native networking
- **SSL/TLS:** Required for all connections
- **Authorized Networks:** Restricted to VPC CIDR ranges
- **Database Flags:** Secure defaults applied

## Usage Examples

### Connect from Compute Engine
```bash
# Install PostgreSQL client
sudo apt-get update
sudo apt-get install postgresql-client

# Connect to database (from within VPC)
psql "host=PRIVATE_IP dbname=demo_db user=demo_user sslmode=require"

# Connect using Cloud SQL Proxy
./cloud_sql_proxy -instances=PROJECT_ID:us-central1:demo-postgres=tcp:5432 &
psql "host=127.0.0.1 port=5432 dbname=demo_db user=demo_user sslmode=require"
```

### Application Connection Strings
```python
# Python example using SQLAlchemy
import sqlalchemy

# Direct private IP connection (from GCP)
engine = sqlalchemy.create_engine(
    "postgresql://demo_user:password@PRIVATE_IP:5432/demo_db",
    connect_args={"sslmode": "require"}
)

# Cloud SQL Proxy connection
engine = sqlalchemy.create_engine(
    "postgresql://demo_user:password@127.0.0.1:5432/demo_db"
)
```

### Database Operations
```sql
-- Create application schema
CREATE SCHEMA app;

-- Create sample table
CREATE TABLE app.users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Grant permissions
GRANT ALL PRIVILEGES ON SCHEMA app TO demo_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA app TO demo_user;
```

## Backup and Recovery

### Automated Backups
- **Schedule:** Daily at 4:00 AM UTC
- **Retention:** 7 days
- **Location:** Same region as instance
- **Point-in-time Recovery:** Available within retention period

### Manual Operations
```bash
# Create manual backup
gcloud sql backups create --instance=demo-postgres

# List backups
gcloud sql backups list --instance=demo-postgres

# Restore from backup
gcloud sql backups restore BACKUP_ID --restore-instance=demo-postgres-restored
```

### Export/Import Data
```bash
# Export database to Cloud Storage
gcloud sql export sql demo-postgres gs://demo-backup-bucket-PROJECT_ID/demo_db_backup.sql \
    --database=demo_db

# Import from Cloud Storage
gcloud sql import sql demo-postgres gs://demo-backup-bucket-PROJECT_ID/demo_db_backup.sql \
    --database=demo_db
```

## Scaling and Performance

### Vertical Scaling
```bash
# Upgrade machine type
gcloud sql instances patch demo-postgres \
    --tier=db-standard-2 \
    --activation-policy=ALWAYS

# Increase storage
gcloud sql instances patch demo-postgres \
    --storage-size=50GB
```

### Read Replicas
```bash
# Create read replica
gcloud sql instances create demo-postgres-replica \
    --master-instance-name=demo-postgres \
    --tier=db-f1-micro \
    --region=us-west1
```

### Connection Pooling
- Use pgBouncer or similar for connection pooling
- Configure max_connections based on instance tier
- Monitor connection usage in Cloud Monitoring

## Monitoring and Alerting

### Key Metrics
- **CPU Utilization:** Target <80% for optimal performance
- **Memory Usage:** Monitor for memory pressure
- **Storage Usage:** Track disk space consumption
- **Connection Count:** Monitor active connections
- **Replication Lag:** For read replicas

### Alert Policies
```bash
# CPU utilization alert
gcloud alpha monitoring policies create \
    --policy-from-file=cpu-alert-policy.yaml

# Storage utilization alert
gcloud alpha monitoring policies create \
    --policy-from-file=storage-alert-policy.yaml
```

## Security Best Practices

### Network Security
- Private IP only (no public IP assigned)
- VPC firewall rules restrict database access
- Cloud SQL Proxy for secure connections from outside GCP

### Access Control
- IAM-based database access where possible
- Strong passwords stored in Secret Manager
- Regular password rotation
- Principle of least privilege for database users

### Encryption
- **At Rest:** Automatic encryption with Google-managed keys
- **In Transit:** SSL/TLS required for all connections
- **Option:** Customer-managed encryption keys (CMEK)

## Maintenance and Updates

### Automatic Updates
- **Minor versions:** Applied automatically during maintenance window
- **Major versions:** Manual upgrade required
- **Security patches:** Applied automatically

### Maintenance Window
```bash
# Update maintenance window
gcloud sql instances patch demo-postgres \
    --maintenance-window-day=SUN \
    --maintenance-window-hour=4
```

## Cost Optimization

### Instance Sizing
- Start with smaller instances and scale up as needed
- Use committed use discounts for production workloads
- Consider regional persistent disks for high availability

### Storage Optimization
- Use appropriate storage size (auto-resize prevents over-provisioning)
- Archive old data to Cloud Storage
- Monitor and optimize query performance

## Troubleshooting

### Common Issues
1. **Connection timeouts:** Check VPC connectivity and firewall rules
2. **High CPU:** Analyze slow queries and consider scaling up
3. **Storage full:** Enable auto-resize or manually increase storage
4. **Backup failures:** Check Cloud Storage permissions and quotas

### Diagnostic Commands
```bash
# Check instance status
gcloud sql instances describe demo-postgres

# View recent operations
gcloud sql operations list --instance=demo-postgres

# Check logs
gcloud logging read "resource.type=gce_instance AND logName=projects/PROJECT_ID/logs/postgres"
```
