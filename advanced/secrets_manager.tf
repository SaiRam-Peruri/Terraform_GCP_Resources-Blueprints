// GCP Secret Manager Secret and Version - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "secret_id" {
  description = "The name of the secret."
  type        = string
}

variable "secret_data" {
  description = "The secret data (string)."
  type        = string
  sensitive   = true
}

resource "google_secret_manager_secret" "default" {
  secret_id = var.secret_id
  project   = var.project_id

  replication {
    user_managed {
      replicas {
        location = "us-east4" # Northern Virginia, closest to Boston
      }
    }
  }
}

resource "google_secret_manager_secret_version" "default" {
  secret      = google_secret_manager_secret.default.id
  secret_data = var.secret_data
}

output "secret_manager_secret_id" {
  description = "The ID of the created secret."
  value       = google_secret_manager_secret.default.id
}
