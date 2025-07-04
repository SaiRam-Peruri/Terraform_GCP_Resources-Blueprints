# Outputs Module Documentation

This module provides outputs for the Terraform GCP resource library. Outputs are used to expose resource attributes and values for use in other modules or for informational purposes after deployment.

## What It Does
- Exposes key resource attributes (e.g., IDs, IPs, URLs) as outputs.
- Enables inter-module communication and integration.

## Why Use It
- Facilitates referencing important resource values in other modules or outputs.
- Improves visibility and traceability of deployed resources.

## Usage Example
```hcl
output "instance_ip" {
  value = module.compute_vm.instance_ip
}
```

## Inputs/Outputs
See the module's outputs for details on what is exposed.
