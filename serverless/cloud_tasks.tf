// cloud tasks resource

// GCP Cloud Tasks Queue - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location" {
  description = "The location for the Cloud Tasks queue."
  type        = string
}

variable "queue_name" {
  description = "The name of the Cloud Tasks queue."
  type        = string
}

resource "google_cloud_tasks_queue" "queue" {
  name     = var.queue_name
  project  = var.project_id
  location = var.location
  // Add retry config, rate limits, etc. as needed
}

output "cloud_tasks_queue_id" {
  description = "The ID of the created Cloud Tasks queue."
  value       = google_cloud_tasks_queue.queue.id
}
