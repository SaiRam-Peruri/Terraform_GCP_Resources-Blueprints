# Persistent Disk Storage

## Overview
Creates Google Compute Engine persistent disks for additional storage capacity, designed for high availability and performance across different disk types.

## Deployed Resources
- **Additional Disk:** `demo-disk`
  - **Size:** 100GB
  - **Type:** pd-standard (Standard persistent disk)
  - **Zone:** us-central1-a
  - **Encryption:** Google-managed encryption keys

## Disk Types and Performance

### Standard Persistent Disk (pd-standard)
- **IOPS:** 0.75 IOPS per GB (75 IOPS for 100GB)
- **Throughput:** 120 MB/s read, 90 MB/s write
- **Use Cases:** Backup storage, file servers, batch processing

### SSD Persistent Disk (pd-ssd)
- **IOPS:** 30 IOPS per GB (3,000 IOPS for 100GB)
- **Throughput:** 480 MB/s read/write
- **Use Cases:** Databases, high-performance applications

### Balanced Persistent Disk (pd-balanced)
- **IOPS:** 6 IOPS per GB (600 IOPS for 100GB)
- **Throughput:** 240 MB/s read/write
- **Use Cases:** General purpose workloads, cost-effective performance

## Usage Examples

### Attach Disk to VM
```bash
# Attach disk to running instance
gcloud compute instances attach-disk demo-instance \
    --disk=demo-disk \
    --zone=us-central1-a
```

### Format and Mount (on VM)
```bash
# Format the disk (one-time operation)
sudo mkfs.ext4 -F /dev/sdb

# Create mount point
sudo mkdir -p /mnt/demo-disk

# Mount the disk
sudo mount /dev/sdb /mnt/demo-disk

# Add to fstab for persistent mounting
echo '/dev/sdb /mnt/demo-disk ext4 defaults 0 2' | sudo tee -a /etc/fstab
```

### Disk Operations
```bash
# Create snapshot
gcloud compute disks snapshot demo-disk \
    --snapshot-names=demo-disk-snapshot-$(date +%Y%m%d) \
    --zone=us-central1-a

# Resize disk (can only increase size)
gcloud compute disks resize demo-disk \
    --size=200GB \
    --zone=us-central1-a

# Check disk details
gcloud compute disks describe demo-disk --zone=us-central1-a
```

## Backup and Recovery

### Snapshot Strategy
- **Automated Snapshots:** Use Cloud Scheduler for regular backups
- **Retention Policy:** Keep daily snapshots for 7 days, weekly for 4 weeks
- **Cross-region:** Store snapshots in multiple regions for disaster recovery

### Example Snapshot Schedule
```bash
# Create snapshot schedule
gcloud compute resource-policies create snapshot-schedule daily-backup \
    --max-retention-days=7 \
    --on-source-disk-delete=keep-auto-snapshots \
    --storage-location=us \
    --daily-schedule \
    --start-time=02:00
```

## Security and Encryption

### Encryption Options
- **Google-managed keys:** Default, no additional configuration
- **Customer-managed keys:** Use Cloud KMS for enhanced control
- **Customer-supplied keys:** Provide your own encryption keys

### Access Control
- Disk access controlled through VM service account permissions
- Use IAM roles for granular access control
- Enable audit logging for disk operations

## Monitoring and Alerts

### Key Metrics
- **Disk utilization:** Monitor space usage
- **IOPS utilization:** Track I/O performance
- **Throughput:** Monitor read/write speeds
- **Snapshot frequency:** Ensure backups are running

### Alert Policies
- Disk space > 80% full
- IOPS utilization > 80%
- Snapshot failures
- Disk attachment/detachment events

## Performance Optimization

### Best Practices
- Choose appropriate disk type for workload
- Size disks to meet IOPS requirements
- Use multiple disks for higher throughput
- Consider regional persistent disks for high availability

### IOPS Calculation
```
Standard PD: size_gb × 0.75 = max_iops
SSD PD: size_gb × 30 = max_iops (max 15,000)
Balanced PD: size_gb × 6 = max_iops (max 80,000)
```

## Cost Optimization
- Use standard disks for infrequent access patterns
- Right-size disks based on actual usage
- Delete unused snapshots regularly
- Consider disk compression for cold storage
