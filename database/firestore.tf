// GCP Firestore Database - modular and production-grade

resource "google_firestore_database" "default" {
  name        = "(default)"
  project     = local.project_id
  location_id = local.location_id
  type        = local.firestore_type
}

output "firestore_database_name" {
  description = "The name of the created Firestore database."
  value       = google_firestore_database.default.name
}
