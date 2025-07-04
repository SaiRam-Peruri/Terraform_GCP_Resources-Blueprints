// GCP Firestore Database - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location_id" {
  description = "The location for the Firestore database."
  type        = string
  default     = "us-central"
}

variable "type" {
  description = "The type of Firestore database (NATIVE or DATASTORE_MODE)."
  type        = string
  default     = "NATIVE"
}

resource "google_firestore_database" "default" {
  name        = "(default)"
  project     = var.project_id
  location_id = var.location_id
  type        = var.type
}

output "firestore_database_name" {
  description = "The name of the created Firestore database."
  value       = google_firestore_database.default.name
}
