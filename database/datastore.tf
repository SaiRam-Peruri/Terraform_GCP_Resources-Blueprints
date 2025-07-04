// datastore resource

// GCP Datastore (legacy) - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location_id" {
  description = "The location for the Datastore."
  type        = string
  default     = "us-central"
}

resource "google_datastore_index" "default" {
  project     = var.project_id
  kind        = "SampleKind"
  properties {
    name      = "sampleProperty"
    direction = "ASCENDING"
  }
}

output "datastore_index_id" {
  description = "The ID of the created Datastore index."
  value       = google_datastore_index.default.id
}
