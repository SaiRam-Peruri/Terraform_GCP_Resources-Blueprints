// Main IAM module file - orchestrates all IAM resources

// The resources are defined in their respective .tf files in this same directory:
// - service_account.tf: Service accounts
// - custom_roles.tf: Custom IAM roles
// - iam_binding.tf: IAM bindings
// - audit_logging.tf: Audit logging configuration
// - workload_identity.tf: Workload identity pools
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

locals {
  # Common configuration
  project_id = var.project_id

  # Service Account configuration
  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description

  # Custom role configuration
  role_id     = var.role_id != null ? var.role_id : "${var.account_id}-role"
  title       = var.title != null ? var.title : "Custom Role for ${var.account_id}"
  permissions = var.permissions
  stage       = var.stage

  # IAM binding configuration
  role    = var.role
  members = var.members

  # Workload identity configuration
  pool_id           = var.pool_id != null ? var.pool_id : "${var.account_id}-wi-pool-v3"
  pool_display_name = "WI Pool" # Keep under 32 characters

  # Audit logging configuration
  service   = var.service != null ? var.service : "storage.googleapis.com"
  log_types = var.log_types

  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "iam"
  }
}

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf
