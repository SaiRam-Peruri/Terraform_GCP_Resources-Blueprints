// eventarc resource

// GCP Eventarc Trigger - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location" {
  description = "The location for the Eventarc trigger."
  type        = string
}

variable "trigger_name" {
  description = "The name of the Eventarc trigger."
  type        = string
}

variable "destination_run_service" {
  description = "The Cloud Run service to trigger."
  type        = string
}

variable "event_filters" {
  description = "A map of event filters."
  type        = map(string)
}

resource "google_eventarc_trigger" "trigger" {
  name     = var.trigger_name
  project  = var.project_id
  location = var.location

  dynamic "matching_criteria" {
    for_each = var.event_filters
    content {
      attribute = matching_criteria.key
      value     = matching_criteria.value
    }
  }

  destination {
    cloud_run_service {
      service = var.destination_run_service
      region  = var.location
    }
  }
}

output "eventarc_trigger_id" {
  description = "The ID of the created Eventarc trigger."
  value       = google_eventarc_trigger.trigger.id
}
