# Compute Engine VM Instance

## Overview
Creates a Google Compute Engine VM instance with production-ready configuration including startup scripts, service accounts, and network interfaces.

## Deployed Resources
- **VM Instance:** `demo-instance`
  - **Machine Type:** e2-medium (2 vCPU, 4GB RAM)
  - **Zone:** us-central1-a
  - **Boot Disk:** 20GB pd-standard with Ubuntu 20.04 LTS
  - **Network:** Attached to demo VPC private subnet
  - **Service Account:** Compute service account with logging/monitoring scopes

## Configuration Details

### Instance Configuration
- **Image:** ubuntu-os-cloud/ubuntu-2004-lts
- **Boot Disk:** Persistent disk with automatic deletion
- **Network Tags:** `["webserver", "demo"]` for firewall targeting
- **Preemptible:** Disabled for production stability

### Service Account
- Uses dedicated compute service account
- Scopes: cloud-platform, logging-write, monitoring-write
- Enables secure access to GCP services

### Startup Script
- Installs and configures Apache web server
- Sets up monitoring and logging agents
- Configures automatic security updates
- Creates sample web content

## Usage Examples

### SSH Access
```bash
# SSH to the instance
gcloud compute ssh demo-instance --zone=us-central1-a --project=your-project-id

# Copy files to instance
gcloud compute scp local-file.txt demo-instance:~/remote-file.txt --zone=us-central1-a
```

### Instance Management
```bash
# Start instance
gcloud compute instances start demo-instance --zone=us-central1-a

# Stop instance
gcloud compute instances stop demo-instance --zone=us-central1-a

# Check instance status
gcloud compute instances describe demo-instance --zone=us-central1-a
```

## Monitoring and Maintenance

### Health Checks
- Instance automatically reports health to Cloud Monitoring
- Uptime checks configured for web server availability
- Alert policies trigger on instance down or high CPU usage

### Backups
- Boot disk snapshots can be scheduled using Cloud Scheduler
- Custom machine images can be created for deployment templates

### Security
- Instance uses private IP with Cloud NAT for outbound access
- Firewall rules restrict inbound access to necessary ports
- OS Login enabled for secure SSH key management

## Troubleshooting

### Common Issues
1. **Instance won't start:** Check quotas and zone availability
2. **Can't SSH:** Verify firewall rules and OS Login configuration
3. **High CPU:** Scale up machine type or optimize workload
4. **Disk full:** Resize persistent disk or add additional disks

### Log Locations
- **System logs:** Cloud Logging under Compute Engine resource
- **Application logs:** `/var/log/` on the instance
- **Startup script logs:** Cloud Logging or `/var/log/daemon.log`

## Cost Optimization
- Use sustained use discounts for long-running instances
- Consider preemptible instances for fault-tolerant workloads
- Right-size instances based on actual usage patterns
- Use committed use discounts for predictable workloads
