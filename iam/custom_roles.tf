// custom roles resource

// GCP Custom IAM Role - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "role_id" {
  description = "The ID of the custom role."
  type        = string
}

variable "title" {
  description = "The title of the custom role."
  type        = string
}

variable "permissions" {
  description = "The list of permissions for the custom role."
  type        = list(string)
}

resource "google_project_iam_custom_role" "custom_role" {
  project     = var.project_id
  role_id     = var.role_id
  title       = var.title
  permissions = var.permissions
  stage       = "GA"
}

output "custom_role_id" {
  description = "The ID of the created custom IAM role."
  value       = google_project_iam_custom_role.custom_role.id
}
