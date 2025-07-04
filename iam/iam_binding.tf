// iam binding resource

// GCP IAM Binding - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "role" {
  description = "The IAM role to assign."
  type        = string
}

variable "members" {
  description = "The list of members to bind to the role."
  type        = list(string)
}

resource "google_project_iam_binding" "binding" {
  project = var.project_id
  role    = var.role
  members = var.members
}

output "iam_binding_id" {
  description = "The ID of the created IAM binding."
  value       = google_project_iam_binding.binding.id
}
