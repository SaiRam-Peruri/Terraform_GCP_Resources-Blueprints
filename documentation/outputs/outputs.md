# Outputs Module Documentation

## Overview
The outputs module provides centralized output management for the entire GCP Terraform infrastructure. It exposes key resource attributes and values from all deployed modules for external reference, monitoring, and integration purposes.

## Architecture
- **Centralized Design**: All module outputs are aggregated in a single location
- **Module References**: Uses module outputs rather than direct resource references
- **Production Ready**: Includes comprehensive output coverage for all infrastructure components

## Available Outputs

### Networking
- `vpc_network_id` - The ID of the VPC network
- `subnet_id` - The ID of the subnet
- `firewall_rule_id` - The ID of the firewall rule

### Compute
- `vm_instance_id` - The ID of the VM instance
- `vm_public_ip` - The public IP address of the VM instance

### Storage
- `storage_bucket_name` - The name of the storage bucket
- `storage_bucket_url` - The URL of the storage bucket

### IAM
- `service_account_email` - The email of the service account
- `service_account_id` - The ID of the service account

### Serverless
- `cloud_function_url` - The HTTPS URL of the deployed Cloud Function
- `cloud_run_url` - The URL of the Cloud Run service

### Database
- `cloudsql_instance_connection_name` - The connection name of the Cloud SQL instance
- `bigquery_dataset_id` - The ID of the BigQuery dataset
- `redis_instance_host` - The host of the Redis instance

### Monitoring
- `monitoring_alert_policy_id` - The ID of the monitoring alert policy
- `log_sink_writer_identity` - The writer identity of the log sink

## Future Outputs (Available when modules are enabled)
Additional outputs are available when optional modules are enabled:
- Container/GKE outputs
- DevOps CI/CD outputs
- Scheduler and messaging outputs
- Advanced security feature outputs

## Usage Example
```hcl
# Reference outputs in other configurations
output "infrastructure_endpoints" {
  value = {
    cloud_function = module.outputs.cloud_function_url
    cloud_run      = module.outputs.cloud_run_url
    vm_ip          = module.outputs.vm_public_ip
  }
}
```

## Integration
These outputs can be used for:
- **External Integration**: Reference URLs and endpoints in CI/CD pipelines
- **Monitoring Setup**: Use IDs for monitoring and alerting configurations
- **Documentation**: Auto-generate infrastructure documentation
- **Testing**: Validate deployed resources in automated tests

## Best Practices
- Use descriptive output names that clearly indicate the resource type and attribute
- Include sensitive = true for any outputs containing credentials or private information
- Document each output with clear descriptions
- Group related outputs by module/service type for better organization
