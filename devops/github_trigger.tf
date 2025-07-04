// GCP Cloud Build GitHub Trigger - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "trigger_name" {
  description = "The name of the GitHub trigger."
  type        = string
}

variable "owner" {
  description = "The GitHub owner."
  type        = string
}

variable "repo_name" {
  description = "The GitHub repository name."
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

resource "google_cloudbuild_trigger" "github_trigger" {
  project     = var.project_id
  name        = var.trigger_name
  github {
    owner = var.owner
    name  = var.repo_name
    push {
      branch = var.branch_regex
    }
  }
  filename = var.build_config_path
}

output "github_trigger_id" {
  description = "The ID of the created GitHub trigger."
  value       = google_cloudbuild_trigger.github_trigger.id
}
