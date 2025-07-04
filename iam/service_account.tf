// GCP Service Account - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "account_id" {
  description = "The service account ID (must be unique within the project)."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = string
}

variable "description" {
  description = "The description for the service account."
  type        = string
  default     = ""
}

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