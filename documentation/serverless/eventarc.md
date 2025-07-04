# Eventarc

This module provisions Google Eventarc resources for event routing and delivery across GCP services.

## What It Does
- Configures Eventarc triggers and destinations.
- Supports integration with Cloud Run, Functions, and other services.

## Why Use It
- Enables event-driven architectures across GCP.
- Simplifies event routing and management.

## Usage Example
```hcl
module "eventarc" {
  source = "../serverless/eventarc"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
