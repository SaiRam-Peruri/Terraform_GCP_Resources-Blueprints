# Cloud Function

This module provisions Google Cloud Functions for serverless compute, enabling you to run code in response to events without managing servers.

## What It Does
- Deploys Cloud Functions with environment variables and triggers.
- Supports HTTP and event-based triggers.

## Why Use It
- Simplifies event-driven architectures.
- Scales automatically with demand.

## Usage Example
```hcl
module "cloud_function" {
  source = "../serverless/cloud_function"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
