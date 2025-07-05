// GCP Monitoring Uptime Check - modular and production-grade

resource "google_monitoring_uptime_check_config" "default" {
  project      = var.project_id
  display_name = var.uptime_check_name
  timeout      = "10s"
  period       = "60s"

  http_check {
    path = var.path
    port = 80
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      host = var.host
    }
  }
}

output "uptime_check_id" {
  description = "The ID of the created uptime check."
  value       = google_monitoring_uptime_check_config.default.id
}
