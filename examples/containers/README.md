# 🐳 Containers Module (GKE)

**Status:** 📘 **Example Module** (Not Currently Deployed)

## Overview
This module provides Google Kubernetes Engine (GKE) infrastructure:
- ⚓ **GKE Clusters**: Standard and Autopilot clusters
- 🏗️ **Node Pools**: Managed compute resources
- 🔧 **Add-ons**: Monitoring, logging, networking
- 🔒 **Workload Identity**: Secure pod-to-GCP authentication

## Resources Included
- `google_container_cluster` - GKE cluster
- `google_container_node_pool` - Worker node pools
- Various GKE add-ons and configurations

## To Enable This Module
1. Copy module to root directory:
```bash
cp -r examples/containers ./
```

2. Uncomment in `main.tf`:
```terraform
module "containers" {
  source         = "./containers"
  project_id     = var.project_id
  region         = var.region
  cluster_name   = var.gke_name
  network_id     = module.networking.vpc_network_id
  subnet_id      = module.networking.subnet_id
  node_pool_name = var.gke_node_pool_name
  node_count     = var.gke_node_count
  machine_type   = var.gke_machine_type
}
```

2. Add variables to `terraform.tfvars`:
```terraform
gke_name           = "my-gke-cluster"
gke_node_pool_name = "my-gke-nodes"
gke_node_count     = 1
gke_machine_type   = "e2-medium"
```

3. Deploy:
```bash
terraform plan
terraform apply
```

## Cost Considerations
- GKE clusters have management fees
- Node pools consume compute resources
- Consider preemptible nodes for cost optimization

---
**Part of:** [Terraform GCP Resources-Blueprints](../README.md)
