# Email Notification

This module provisions resources for sending email notifications, typically using Pub/Sub and third-party integrations (e.g., SendGrid, SMTP relays).

## What It Does
- Configures Pub/Sub topics and subscriptions for email triggers.
- Integrates with external email services.

## Why Use It
- Enables automated email alerts and notifications.
- Supports event-driven communication in your GCP environment.

## Usage Example
```hcl
module "email_notification" {
  source = "../scheduler_messaging/email_notification"
  # ...variables...
}
```

## Inputs/Outputs
See the module's variables and outputs for configuration details.
