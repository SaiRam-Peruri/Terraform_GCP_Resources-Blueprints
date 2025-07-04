// cloudbuild resource

// GCP Cloud Build Trigger - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "trigger_name" {
  description = "The name of the Cloud Build trigger."
  type        = string
}

variable "repo_name" {
  description = "The name of the source repository."
  type        = string
}

variable "branch_regex" {
  description = "The regex for the branch to trigger on."
  type        = string
  default     = "^main$"
}

variable "build_config_path" {
  description = "The path to the build config file (cloudbuild.yaml)."
  type        = string
  default     = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "trigger" {
  project     = var.project_id
  name        = var.trigger_name
  trigger_template {
    repo_name = var.repo_name
    branch_name = var.branch_regex
  }
  filename = var.build_config_path
}

output "cloudbuild_trigger_id" {
  description = "The ID of the created Cloud Build trigger."
  value       = google_cloudbuild_trigger.trigger.id
}
