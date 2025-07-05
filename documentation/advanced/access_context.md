# Access Context Manager Module

## Overview
Provides enterprise-grade access context management for GCP organizations. Creates access policies for context-aware security controls and BeyondCorp-style security implementations.

## Features
- **Conditional Creation**: Only creates resources when `enable_access_context = true`
- **Organization-Level**: Creates access policies at the organization level
- **Security Perimeters**: Foundation for implementing security boundaries
- **Context-Aware Access**: Enables access controls based on user identity, device status, and location

## Architecture
The module creates:
- `google_access_context_manager_access_policy` - Organization-level access policy

## Configuration
```hcl
# In terraform.tfvars or variables
enable_access_context = true
organization_id       = "123456789012"
project_name         = "my-project"
```

## Variables
- `enable_access_context` (bool) - Whether to enable Access Context Manager (default: false)
- `organization_id` (string) - The GCP organization ID (required if enabled)
- `project_name` (string) - Used for resource naming

## Outputs
- `access_policy_id` - The ID of the created access policy (null if disabled)

## Usage in Enterprise Security
This module is designed for organizations that need:
- **Zero Trust Security**: Context-aware access controls
- **Compliance**: Meeting security and regulatory requirements
- **Risk Management**: Restricting access based on security context
- **BeyondCorp**: Implementing Google's security model

## Best Practices
- Only enable when you have organization-level access
- Use with service perimeters and access levels for complete security
- Monitor access policy usage through Cloud Logging
- Regularly review and update access policies
