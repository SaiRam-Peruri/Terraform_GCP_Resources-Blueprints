# ⏰ Scheduler & Messaging Module

**Status:** 📘 **Example Module** (Not Currently Deployed)

## Overview
This module provides event-driven and scheduled computing:
- ⏰ **Cloud Scheduler**: Cron-based job scheduling
- 📨 **Pub/Sub**: Asynchronous messaging
- 📧 **Email Notifications**: Alert integrations
- 🔔 **Event Processing**: Message-driven workflows

## Resources Included
- `google_cloud_scheduler_job` - Scheduled jobs
- `google_pubsub_topic` - Message topics
- `google_pubsub_subscription` - Message subscriptions
- Email notification configurations

## To Enable This Module
1. Copy module to root directory:
```bash
cp -r examples/scheduler_messaging ./
```

2. Uncomment in `main.tf`:
```terraform
module "scheduler_messaging" {
  source            = "./scheduler_messaging"
  project_id        = var.project_id
  name              = var.scheduler_name
  topic_name        = var.scheduler_topic_name
  subscription_name = var.scheduler_subscription_name
  schedule          = var.scheduler_cron
  topic             = var.pubsub_topic
  pubsub_topic      = var.pubsub_topic
}
```

2. Add variables to `terraform.tfvars`:
```terraform
scheduler_name              = "my-scheduler"
scheduler_cron              = "0 9 * * 1"  # Every Monday at 9 AM
pubsub_topic                = "my-pubsub-topic"
scheduler_topic_name        = "my-scheduler-topic"
scheduler_subscription_name = "my-scheduler-sub"
```

3. Deploy:
```bash
terraform plan
terraform apply
```

## Use Cases
- Automated data processing jobs
- Regular maintenance tasks
- Event-driven microservices
- Batch processing workflows

---
**Part of:** [Terraform GCP Resources-Blueprints](../README.md)
