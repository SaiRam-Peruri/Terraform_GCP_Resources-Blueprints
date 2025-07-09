# Shared VPC Module

## Overview
Provides enterprise-grade Shared VPC configuration for centralized network management across multiple GCP projects. Enables organizations to manage network resources centrally while allowing service projects to consume them.

## Features
- **Conditional Creation**: Only creates resources when `enable_shared_vpc = true`
- **Host Project Configuration**: Sets up the host project for Shared VPC
- **Service Project Attachment**: Attaches service projects to the Shared VPC
- **Centralized Management**: Single point of network control

## Architecture
The module creates:
- `google_compute_shared_vpc_host_project` - Configures the host project
- `google_compute_shared_vpc_service_project` - Attaches service project to host

## Configuration
```hcl
# In terraform.tfvars or variables
enable_shared_vpc = true
host_project_id   = "network-host-project"
project_id        = "service-project-123"  # This project becomes a service project
```

## Variables
- `enable_shared_vpc` (bool) - Whether to enable Shared VPC (default: false)
- `host_project_id` (string) - The project ID of the Shared VPC host
- `project_id` (string) - The current project ID (becomes service project)

## Outputs
- `shared_vpc_host_project_id` - The ID of the Shared VPC host project (null if disabled)
- `shared_vpc_service_project_id` - The ID of the attached service project (null if disabled)

## Use Cases
- **Enterprise Networks**: Centralized network management across departments
- **Multi-Project Applications**: Applications spanning multiple projects
- **Security Compliance**: Centralized network security policies
- **Cost Optimization**: Shared network resources and IP address management

## Best Practices
- Designate dedicated host projects for network resources
- Use IAM roles to control access to shared network resources
- Plan IP address allocation across all service projects
- Monitor network usage and costs at the host project level
- Document Shared VPC relationships for compliance and auditing
