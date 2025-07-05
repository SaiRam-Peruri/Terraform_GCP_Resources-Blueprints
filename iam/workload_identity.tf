// GCP Workload Identity Pool - modular and production-grade

resource "google_iam_workload_identity_pool" "pool" {
  project                   = local.project_id
  workload_identity_pool_id = local.pool_id
  display_name              = local.pool_display_name
}

output "workload_identity_pool_id" {
  description = "The ID of the created workload identity pool."
  value       = google_iam_workload_identity_pool.pool.id
}
