# Cloud Run

This module provisions Google Cloud Run services for running containerized applications in a fully managed serverless environment.

## What It Does
- Deploys containers to Cloud Run.
- Manages service configuration, traffic splitting, and IAM.

## Why Use It
- Runs stateless containers with automatic scaling.
- No infrastructure management required.

## Usage Example
```hcl
module "cloud_run" {
  source = "../serverless/cloud_run"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
