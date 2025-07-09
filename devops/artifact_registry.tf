// GCP Artifact Registry Repository - modular and production-grade

resource "google_artifact_registry_repository" "repo" {
  project       = var.project_id
  location      = var.location
  repository_id = var.repository_id
  format        = var.format
}

output "artifact_registry_repo_id" {
  description = "The ID of the created artifact registry repository."
  value       = google_artifact_registry_repository.repo.id
}
