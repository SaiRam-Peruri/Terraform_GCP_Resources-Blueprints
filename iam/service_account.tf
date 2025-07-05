// GCP Service Account - modular and production-grade

resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description
  project      = var.project_id
}

output "service_account_email" {
  description = "The email address of the created service account."
  value       = google_service_account.service_account.email
}

output "service_account_id" {
  description = "The ID of the created service account."
  value       = google_service_account.service_account.id
}

output "service_account_unique_id" {
  description = "The unique ID of the created service account."
  value       = google_service_account.service_account.unique_id
}