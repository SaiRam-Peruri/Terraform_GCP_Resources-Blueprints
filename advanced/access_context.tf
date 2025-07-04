// GCP Access Context Manager - modular and production-grade

variable "organization_id" {
  description = "The GCP organization ID."
  type        = string
}

variable "access_policy_title" {
  description = "The title for the access policy."
  type        = string
}

resource "google_access_context_manager_access_policy" "default" {
  parent = "organizations/${var.organization_id}"
  title  = var.access_policy_title
}

output "access_policy_id" {
  description = "The ID of the created access policy."
  value       = google_access_context_manager_access_policy.default.id
}
