// GCP Cloud Run Service - modular and production-grade

resource "google_cloud_run_service" "service" {
  name     = local.service_name
  project  = local.project_id
  location = local.region

  template {
    spec {
      containers {
        image = local.image
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

output "cloud_run_service_url" {
  description = "The URL of the deployed Cloud Run service."
  value       = google_cloud_run_service.service.status[0].url
}
