// eventarc resource

// GCP Eventarc Trigger - modular and production-grade
// Note: Only creates trigger when event_filters are provided

resource "google_eventarc_trigger" "trigger" {
  count    = length(local.event_filters) > 0 && local.destination_run_service != null ? 1 : 0
  name     = local.trigger_name
  project  = local.project_id
  location = local.location

  dynamic "matching_criteria" {
    for_each = local.event_filters
    content {
      attribute = matching_criteria.value.attribute
      value     = matching_criteria.value.value
    }
  }

  destination {
    cloud_run_service {
      service = local.destination_run_service
      region  = local.location
    }
  }
}

output "eventarc_trigger_id" {
  description = "The ID of the created Eventarc trigger."
  value       = length(google_eventarc_trigger.trigger) > 0 ? google_eventarc_trigger.trigger[0].id : null
}
