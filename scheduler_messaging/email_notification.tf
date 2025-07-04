// email notification resource

// GCP Email Notification via Pub/Sub - modular and production-grade
// Note: GCP does not support direct email notifications via Terraform. Use Pub/Sub + Cloud Function or Notification Channel.

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "topic_name" {
  description = "The Pub/Sub topic name for email notifications."
  type        = string
}

resource "google_pubsub_topic" "email" {
  name    = var.topic_name
  project = var.project_id
}

output "email_notification_topic" {
  description = "The Pub/Sub topic for email notifications."
  value       = google_pubsub_topic.email.name
}
