// cloud tasks resource

// GCP Cloud Tasks Queue - modular and production-grade

resource "google_cloud_tasks_queue" "queue" {
  name     = local.queue_name
  project  = local.project_id
  location = local.location
  // Add retry config, rate limits, etc. as needed
}

output "cloud_tasks_queue_id" {
  description = "The ID of the created Cloud Tasks queue."
  value       = google_cloud_tasks_queue.queue.id
}
