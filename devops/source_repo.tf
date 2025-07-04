// GCP Source Repository - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "repo_name" {
  description = "The name of the source repository."
  type        = string
}

resource "google_sourcerepo_repository" "repo" {
  project = var.project_id
  name    = var.repo_name
}

output "source_repo_id" {
  description = "The ID of the created source repository."
  value       = google_sourcerepo_repository.repo.id
}
