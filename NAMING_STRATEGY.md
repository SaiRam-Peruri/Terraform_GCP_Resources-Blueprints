# GCP Resources: Soft Deletion and Naming Strategy Guide

## Resources That Need New Names Every Deploy/Destroy Cycle

### 🔥 **Critical (Always Need New Names)**
1. **Firestore Database** - `(default)` - Cannot change, use different projects
2. **Workload Identity Pool** - `terraform-wi-pool-TIMESTAMP` - Auto-versioned
3. **Cloud Tasks Queue** - `terraform-tasks-queue-TIMESTAMP` - Auto-versioned

### ⚠️ **Sometimes Problematic**
4. **BigQuery Datasets** - If using custom names (60-day retention)
5. **Cloud KMS Keys** - Cannot be deleted, only disabled
6. **Secret Manager Secrets** - Can have retention policies

### ✅ **Safe (No Naming Conflicts)**
- Compute instances, disks, networks
- Storage buckets (immediate deletion)
- Cloud SQL instances  
- Cloud Run services
- Cloud Functions
- IAM service accounts
- Most networking resources

## Current Auto-Versioning Strategy

### Implemented:
- **Workload Identity Pool**: `terraform-wi-pool-YYYYMMDD-hhmm`
- **Cloud Tasks Queue**: `terraform-tasks-queue-YYYYMMDD-hhmm`

### How It Works:
```hcl
locals {
  timestamp = formatdate("YYYYMMDD-hhmm", timestamp())
  pool_id   = "terraform-wi-pool-${local.timestamp}"
  queue_name = "terraform-tasks-queue-${local.timestamp}"
}
```

## Best Practices for Smooth Cycles

### 1. **Quick Testing Cycles**
```bash
# Always works - no naming conflicts
terraform apply
terraform destroy
terraform apply  # ✅ Works immediately
```

### 2. **Resource-Specific Notes**
- **Firestore**: Import existing database or use separate projects
- **Workload Identity**: Auto-timestamped, always unique
- **Cloud Tasks**: Auto-timestamped, always unique
- **Storage Buckets**: Immediate deletion, no conflicts

### 3. **Emergency Manual Override**
If timestamp fails, manually increment:
```bash
# In variables.tf or terraform.tfvars
pool_id = "terraform-wi-pool-manual-v5"
queue_name = "terraform-tasks-queue-manual-v5"
```

## Testing Your Setup

Run this sequence to verify smooth cycles:
```bash
terraform plan    # Should show 3 resources to add
terraform apply   # Deploy everything
terraform destroy # Clean up everything  
terraform apply   # Should work immediately - new timestamps
```

## Production Recommendations

1. **Use separate projects** for dev/staging/prod
2. **Keep resource names consistent** in production
3. **Use this timestamp strategy** for development/testing
4. **Document naming patterns** for your team

---

**Status**: ✅ Your configuration now auto-handles naming conflicts!
