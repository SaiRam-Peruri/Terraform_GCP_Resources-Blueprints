// GCP Custom IAM Role - modular and production-grade

resource "google_project_iam_custom_role" "custom_role" {
  count       = var.role_id != null ? 1 : 0
  project     = var.project_id
  role_id     = var.role_id
  title       = var.title
  permissions = var.permissions
  stage       = "GA"
}

output "custom_role_id" {
  description = "The ID of the created custom IAM role."
  value       = length(google_project_iam_custom_role.custom_role) > 0 ? google_project_iam_custom_role.custom_role[0].id : null
}
