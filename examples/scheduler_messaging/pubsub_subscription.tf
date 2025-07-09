// GCP Pub/Sub Subscription - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "subscription_name" {
  description = "The name of the Pub/Sub subscription."
  type        = string
}

variable "topic" {
  description = "The name of the Pub/Sub topic to subscribe to."
  type        = string
}

variable "ack_deadline_seconds" {
  description = "The ack deadline in seconds."
  type        = number
  default     = 10
}

resource "google_pubsub_subscription" "default" {
  name                 = var.subscription_name
  project              = var.project_id
  topic                = var.topic
  ack_deadline_seconds = var.ack_deadline_seconds
}

output "pubsub_subscription_id" {
  description = "The ID of the created Pub/Sub subscription."
  value       = google_pubsub_subscription.default.id
}
