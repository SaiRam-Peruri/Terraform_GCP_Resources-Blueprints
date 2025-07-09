# VPC Peering Module

## Overview
Provides enterprise-grade VPC network peering capabilities for connecting VPC networks within the same project or across different projects with secure, private connectivity.

## Features
- **Conditional Creation**: Only creates resources when `enable_vpc_peering = true`
- **Bidirectional Peering**: Creates both directions of peering automatically
- **Cross-Project Support**: Supports peering between different GCP projects
- **Private Connectivity**: Secure communication without public internet

## Architecture
The module creates:
- `google_compute_network_peering` (2 resources) - Bidirectional VPC peering connections

## Configuration
```hcl
# In terraform.tfvars or variables
enable_vpc_peering  = true
network_name        = "my-vpc"
peer_project_id     = "peer-project-123"
peer_network_name   = "peer-vpc"
```

## Variables
- `enable_vpc_peering` (bool) - Whether to enable VPC peering (default: false)
- `network_name` (string) - The name of the local VPC network
- `peer_project_id` (string) - The project ID of the peer VPC
- `peer_network_name` (string) - The name of the peer VPC network
- `project_id` (string) - The local project ID

## Outputs
- `vpc_peering1_name` - The name of the first peering connection (null if disabled)
- `vpc_peering2_name` - The name of the second peering connection (null if disabled)

## Use Cases
- **Multi-Project Architecture**: Connect services across project boundaries
- **Microservices**: Enable private communication between service networks
- **Hybrid Cloud**: Connect on-premises networks via VPC peering
- **Environment Separation**: Connect dev/staging/prod environments securely

## Best Practices
- Plan IP address ranges to avoid conflicts
- Use firewall rules to control traffic between peered networks
- Monitor peering connections through Cloud Monitoring
- Document peering relationships for network topology management
