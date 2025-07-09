# Pub/Sub Subscription

This module provisions Google Cloud Pub/Sub subscriptions for message delivery and processing.

## What It Does
- Creates Pub/Sub subscriptions for topics.
- Supports push and pull delivery methods.

## Why Use It
- Enables asynchronous, decoupled communication between services.
- Supports scalable event-driven architectures.

## Usage Example
```hcl
module "pubsub_subscription" {
  source = "../scheduler_messaging/pubsub_subscription"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
