# Cloud Tasks

This module provisions Google Cloud Tasks queues for asynchronous task execution and scheduling.

## What It Does
- Creates and manages Cloud Tasks queues.
- Supports task scheduling and retry policies.

## Why Use It
- Decouples and scales background work.
- Enables reliable, distributed task processing.

## Usage Example
```hcl
module "cloud_tasks" {
  source = "../serverless/cloud_tasks"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
