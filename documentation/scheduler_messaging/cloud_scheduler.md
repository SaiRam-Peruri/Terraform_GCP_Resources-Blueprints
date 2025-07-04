# Cloud Scheduler

This module provisions Google Cloud Scheduler jobs for running scheduled tasks, such as HTTP calls or Pub/Sub messages, on a recurring basis.

## What It Does
- Creates and manages Cloud Scheduler jobs.
- Supports HTTP, Pub/Sub, and App Engine targets.

## Why Use It
- Automates recurring tasks and workflows.
- Integrates with other GCP services for event-driven automation.

## Usage Example
```hcl
module "cloud_scheduler" {
  source = "../scheduler_messaging/cloud_scheduler"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
