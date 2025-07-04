# Provider Module Documentation

This module configures the Google Cloud provider for Terraform. It sets up authentication, project, and region/zone settings required for all GCP resources.

## What It Does
- Configures the `google` provider block.
- Sets credentials, project, and region/zone variables.

## Why Use It
- Centralizes provider configuration for consistency and reusability.
- Ensures all modules use the correct authentication and project context.

## Usage Example
```hcl
provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}
```

## Inputs/Outputs
See the module's variables for configuration options.
