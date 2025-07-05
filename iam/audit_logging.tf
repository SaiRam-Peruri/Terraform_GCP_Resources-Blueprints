// GCP Audit Logging - modular and production-grade

resource "google_project_iam_audit_config" "audit" {
  project = local.project_id
  service = local.service

  dynamic "audit_log_config" {
    for_each = local.log_types
    content {
      log_type = audit_log_config.value
    }
  }
}

output "audit_config_id" {
  description = "The ID of the created audit logging config."
  value       = google_project_iam_audit_config.audit.id
}
