// GCP Monitoring Alert Policy - modular and production-grade

resource "google_monitoring_alert_policy" "default" {
  project      = var.project_id
  display_name = var.alert_policy_display_name
  combiner     = "OR"

  dynamic "conditions" {
    for_each = var.conditions
    content {
      display_name = conditions.value.display_name
      condition_threshold {
        filter          = conditions.value.filter
        duration        = conditions.value.duration
        comparison      = conditions.value.comparison
        threshold_value = conditions.value.threshold_value
        trigger {
          count = lookup(conditions.value, "trigger_count", 1)
        }
      }
    }
  }

  notification_channels = var.notification_channels
}

output "alert_policy_id" {
  description = "The ID of the created alert policy."
  value       = google_monitoring_alert_policy.default.id
}
