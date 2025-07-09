// cloudbuild resource

// GCP Cloud Build Trigger - modular and production-grade

resource "google_cloudbuild_trigger" "trigger" {
  project = var.project_id
  name    = var.trigger_name
  trigger_template {
    repo_name   = var.repo_name
    branch_name = var.branch_regex
  }
  filename = var.build_config_path
}

output "cloudbuild_trigger_id" {
  description = "The ID of the created Cloud Build trigger."
  value       = google_cloudbuild_trigger.trigger.id
}
