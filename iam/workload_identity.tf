// GCP Workload Identity Pool - modular and production-grade
// Uses consistent naming to avoid conflicts from soft-deleted resources

resource "google_iam_workload_identity_pool" "pool" {
  project                   = local.project_id
  workload_identity_pool_id = local.pool_id
  display_name              = local.pool_display_name

  # Add lifecycle rule to handle conflicts gracefully
  lifecycle {
    # Ignore changes to description if resource needs to be recreated
    ignore_changes = [description]
  }
}

output "workload_identity_pool_id" {
  description = "The ID of the created workload identity pool."
  value       = google_iam_workload_identity_pool.pool.id
}
