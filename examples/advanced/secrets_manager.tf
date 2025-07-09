// GCP Secret Manager Secret and Version - modular and production-grade

resource "google_secret_manager_secret" "default" {
  secret_id = "${var.project_name}-secret"
  project   = var.project_id

  replication {
    user_managed {
      replicas {
        location = var.region
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
