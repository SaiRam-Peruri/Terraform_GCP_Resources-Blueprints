// GCP Workload Identity Pool - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "pool_id" {
  description = "The ID of the workload identity pool."
  type        = string
}

variable "display_name" {
  description = "The display name for the pool."
  type        = string
}

resource "google_iam_workload_identity_pool" "pool" {
  project      = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name = var.display_name
}

output "workload_identity_pool_id" {
  description = "The ID of the created workload identity pool."
  value       = google_iam_workload_identity_pool.pool.id
}
