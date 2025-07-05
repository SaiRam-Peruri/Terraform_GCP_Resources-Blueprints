# Terraform GCP Infrastructure: Troubleshooting & Production Tips

This document provides troubleshooting guidance and production best practices for the complete GCP infrastructure blueprint, covering all 40+ deployed resources across compute, storage, networking, databases, monitoring, and serverless services.

---

## Common Issues & Solutions

### 1. API Enablement and Propagation
**Issue:** Resources fail to create due to disabled APIs or API propagation delays.

**Solutions:**
- Ensure all required APIs are enabled: `terraform apply -target=module.provider`
- Wait 2-3 minutes after API enablement before creating resources
- Re-run `terraform apply` if you encounter API-not-enabled errors

**Required APIs:** Cloud Resource Manager, Compute Engine, Cloud Storage, IAM, Cloud SQL, Cloud Functions, Cloud Run, GKE, BigQuery, Pub/Sub, Cloud Build, Cloud KMS, Secret Manager, and more.

---

### 2. Authentication Setup
**Issue:** Authentication failures when running Terraform.

**Solutions:**
- **Local development:** Run `gcloud auth application-default login`
- **CI/CD:** Set `GOOGLE_APPLICATION_CREDENTIALS` environment variable
- **Service account:** Use a service account with Editor or custom IAM roles
- Verify project access: `gcloud projects list`

---

### 3. State Management
**Issue:** State file conflicts or corruption.

**Solutions:**
- Use remote state with GCS backend (configured in `backend.tf`)
- Never edit state files manually
- Use `terraform state` commands for state management
- Import existing resources: `terraform import <resource_type>.<name> <resource_id>`

**Example state operations:**
```bash
terraform state list                    # List all resources
terraform state show <resource>         # Show resource details
terraform import google_storage_bucket.example my-bucket-name
```

---

### 4. Resource Dependencies
**Issue:** Resources fail due to missing dependencies or circular references.

**Solutions:**
- Use explicit `depends_on` when Terraform can't infer dependencies
- Enable APIs before creating resources that depend on them
- Create IAM roles before assigning them to resources
- Ensure networks exist before creating subnets

---

### 5. Quota and Limits
**Issue:** Resource creation fails due to GCP quotas.

**Solutions:**
- Check quotas: Console → IAM & Admin → Quotas
- Request quota increases for: CPU, persistent disks, IPs, GKE nodes
- Monitor usage with Cloud Monitoring
- Use smaller instance types in development

---

### 6. Memory and Performance Issues
**Issue:** Cloud SQL, Redis, or Compute instances running out of resources.

**Solutions:**
- **Cloud SQL:** Increase tier (e.g., from `db-f1-micro` to `db-n1-standard-1`)
- **Redis:** Use STANDARD tier for production, increase memory size
- **Compute:** Monitor CPU/memory usage, scale up instance types
- **GKE:** Enable node auto-scaling, configure resource requests/limits

---

### 7. Network and Firewall
**Issue:** Connectivity problems between resources.

**Solutions:**
- Check firewall rules allow required traffic
- Verify Private Google Access is enabled for private subnets
- Ensure proper VPC peering configuration
- Use Cloud NAT for outbound internet access from private instances

---

### 8. Secrets and Security
**Issue:** Sensitive data exposure or access denied errors.

**Solutions:**
- Use Secret Manager for sensitive configuration
- Configure Workload Identity for GKE service accounts
- Implement least-privilege IAM policies
- Enable audit logging for security monitoring
- Rotate secrets regularly

---

## Production Best Practices

### Resource Naming and Tagging
- Use consistent naming conventions with environment prefixes
- Apply labels for cost tracking and resource management
- Include project ID in globally unique resource names

### Monitoring and Alerting
- Set up uptime checks for critical services
- Configure alert policies for resource utilization
- Use log sinks for centralized logging
- Monitor costs with billing alerts

### Backup and Disaster Recovery
- Enable automated backups for Cloud SQL databases
- Configure bucket versioning and lifecycle policies
- Use multiple zones/regions for critical workloads
- Test disaster recovery procedures regularly

### Security Hardening
- Enable VPC Flow Logs for network monitoring
- Use private clusters for GKE workloads
- Implement network segmentation with firewall rules
- Enable Cloud Armor for web application protection

---

## Module-Specific Troubleshooting

### Compute Module
- **Issue:** VM instances fail to start
- **Solution:** Check startup scripts, disk space, and machine type availability

### Database Module
- **Issue:** Cloud SQL connection failures
- **Solution:** Verify authorized networks, private IP configuration, and user credentials

### Containers Module
- **Issue:** GKE cluster creation timeout
- **Solution:** Check quotas, network configuration, and node pool settings

### Serverless Module
- **Issue:** Cloud Functions deployment failures
- **Solution:** Verify source code packaging, runtime compatibility, and IAM permissions

### Networking Module
- **Issue:** VPC peering or NAT gateway issues
- **Solution:** Check CIDR ranges, route priorities, and firewall rules

---

## Emergency Procedures

### Resource Recovery
1. Identify affected resources: `terraform state list`
2. Check current state: `terraform plan`
3. Import lost resources: `terraform import`
4. Apply configuration: `terraform apply`

### State File Recovery
1. Restore from GCS backend backup
2. Use `terraform state pull` to download current state
3. Manually fix state with `terraform state` commands if necessary

### Complete Environment Rebuild
1. Export important data from databases and storage
2. Run `terraform destroy` to clean up resources
3. Update configuration as needed
4. Run `terraform apply` to rebuild infrastructure

---

## Getting Help

- **Terraform Documentation:** https://terraform.io/docs
- **GCP Documentation:** https://cloud.google.com/docs
- **Community Support:** Stack Overflow, HashiCorp Discuss
- **Enterprise Support:** GCP Support, HashiCorp Support

For module-specific documentation, see the `documentation/` directory.

