// GCP IAM Binding - modular and production-grade

resource "google_project_iam_binding" "binding" {
  count   = var.role != null && length(var.members) > 0 ? 1 : 0
  project = var.project_id
  role    = var.role
  members = var.members
}

output "iam_binding_id" {
  description = "The ID of the created IAM binding."
  value       = length(google_project_iam_binding.binding) > 0 ? google_project_iam_binding.binding[0].id : null
}
