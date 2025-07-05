// GCP Access Context Manager - modular and production-grade
// Only creates resources when enable_access_context is true

resource "google_access_context_manager_access_policy" "default" {
  count  = var.enable_access_context ? 1 : 0
  parent = "organizations/${var.organization_id}"
  title  = "${var.project_name}-access-policy"
}

output "access_policy_id" {
  description = "The ID of the created access policy."
  value       = var.enable_access_context ? google_access_context_manager_access_policy.default[0].id : null
}
