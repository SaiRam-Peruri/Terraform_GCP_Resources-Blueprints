# 🚀 Advanced Features Module

**Status:** 📘 **Example Module** (Not Currently Deployed)

## Overview
This module provides advanced GCP features including:
- 🔐 **Cloud KMS**: Key management and encryption
- 🔒 **Secret Manager**: Secure secret storage
- 🌐 **VPC Peering**: Network connectivity between VPCs
- 🛡️ **Access Context Manager**: Advanced security policies

## Resources Included
- `google_kms_key_ring` - KMS key ring for encryption keys
- `google_kms_crypto_key` - Encryption keys
- `google_secret_manager_secret` - Secret storage
- `google_compute_network_peering` - VPC peering connections
- `google_access_context_manager_access_policy` - Security policies

## To Enable This Module
1. Copy module to root directory:
```bash
cp -r examples/advanced ./
```

2. Uncomment in `main.tf`:
```terraform
module "advanced" {
  source       = "./advanced"
  project_id   = var.project_id
  project_name = var.project_name
  region       = var.region
}
```

3. Add variables to `terraform.tfvars`:
```terraform
advanced_name = "my-advanced"
secret_id     = "my-secret"
secret_data   = "supersecretvalue"
```

4. Deploy:
```bash
terraform plan
terraform apply
```

## Production Considerations
- Enable audit logging for KMS operations
- Use least privilege access for secrets
- Implement key rotation policies
- Monitor access patterns

---
**Part of:** [Terraform GCP Resources-Blueprints](../README.md)
