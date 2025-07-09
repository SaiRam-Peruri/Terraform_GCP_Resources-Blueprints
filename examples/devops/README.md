# 🔄 DevOps Module

**Status:** 📘 **Example Module** (Not Currently Deployed)

## Overview
This module provides CI/CD and DevOps infrastructure:
- 🏗️ **Cloud Build**: Automated build pipelines
- 📦 **Artifact Registry**: Container and package storage
- 🔄 **GitHub Triggers**: Git-based deployments
- 📚 **Source Repositories**: Private Git repositories

## Resources Included
- `google_cloudbuild_trigger` - Build automation
- `google_artifact_registry_repository` - Artifact storage
- `google_sourcerepo_repository` - Git repositories
- GitHub integration configurations

## To Enable This Module
1. Copy module to root directory:
```bash
cp -r examples/devops ./
```

2. Uncomment in `main.tf`:
```terraform
module "devops" {
  source        = "./devops"
  project_id    = var.project_id
  location      = var.devops_location
  name          = var.devops_name
  trigger_name  = "${var.devops_name}-trigger"
  owner         = var.github_owner
  repo_name     = var.devops_repo_name
  repository_id = var.devops_repository_id
}
```

2. Add variables to `terraform.tfvars`:
```terraform
devops_name          = "my-devops"
devops_location      = "us-east4"
devops_repo_name     = "my-devops-repo"
devops_repository_id = "my-artifact-registry"
github_owner         = "your-github-username"
github_repo          = "your-repo-name"
source_repo_id       = "my-source-repo"
```

3. Deploy:
```bash
terraform plan
terraform apply
```

## Prerequisites
- GitHub repository access
- Cloud Build API enabled
- Appropriate IAM permissions for build service account

---
**Part of:** [Terraform GCP Resources-Blueprints](../README.md)
