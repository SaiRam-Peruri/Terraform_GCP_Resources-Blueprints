// GCP Artifact Registry Repository - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location" {
  description = "The location for the repository."
  type        = string
}

variable "repository_id" {
  description = "The ID of the artifact registry repository."
  type        = string
}

variable "format" {
  description = "The format of the repository (DOCKER, MAVEN, etc.)."
  type        = string
  default     = "DOCKER"
}

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
