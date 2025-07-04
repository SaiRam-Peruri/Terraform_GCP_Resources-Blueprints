# Pub/Sub Topic

This module provisions Google Cloud Pub/Sub topics for event publishing and messaging.

## What It Does
- Creates Pub/Sub topics for message publishing.
- Manages IAM policies for topic access.

## Why Use It
- Enables event-driven communication between services.
- Supports scalable, decoupled architectures.

## Usage Example
```hcl
module "pubsub_topic" {
  source = "../scheduler_messaging/pubsub_topic"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
