// monitoring resource

// GCP Monitoring Notification Channel - modular and production-grade

resource "google_monitoring_notification_channel" "default" {
  project      = var.project_id
  type         = var.type
  display_name = var.display_name
  labels       = var.labels
}

output "notification_channel_id" {
  description = "The ID of the created notification channel."
  value       = google_monitoring_notification_channel.default.id
}
