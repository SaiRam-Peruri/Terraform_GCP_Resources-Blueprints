// GCP Audit Logging - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "service" {
  description = "The GCP service to enable audit logging for (e.g., storage.googleapis.com)."
  type        = string
}

variable "log_types" {
  description = "The types of logs to enable (e.g., DATA_READ, DATA_WRITE, ADMIN_READ)."
  type        = list(string)
}

resource "google_project_iam_audit_config" "audit" {
  project = var.project_id
  service = var.service

  dynamic "audit_log_config" {
    for_each = var.log_types
    content {
      log_type = audit_log_config.value
    }
  }
}

output "audit_config_id" {
  description = "The ID of the created audit logging config."
  value       = google_project_iam_audit_config.audit.id
}
