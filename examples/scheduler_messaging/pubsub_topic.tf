// pubsub topic resource

// GCP Pub/Sub Topic - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "topic_name" {
  description = "The name of the Pub/Sub topic."
  type        = string
}

resource "google_pubsub_topic" "default" {
  name    = var.topic_name
  project = var.project_id
}

output "pubsub_topic_id" {
  description = "The ID of the created Pub/Sub topic."
  value       = google_pubsub_topic.default.id
}
