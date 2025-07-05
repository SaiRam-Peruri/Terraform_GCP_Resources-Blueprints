// GCP Persistent Disk - modular and production-grade

resource "google_compute_disk" "pd" {
  count   = var.disk_name != null ? 1 : 0
  name    = var.disk_name
  zone    = var.zone
  size    = var.size_gb
  type    = var.disk_type
  project = var.project_id

  labels = {
    environment = "development"
    managed-by  = "terraform"
  }
}

output "disk_id" {
  description = "The ID of the created persistent disk."
  value       = length(google_compute_disk.pd) > 0 ? google_compute_disk.pd[0].id : null
}

output "disk_self_link" {
  description = "The self link of the created persistent disk."
  value       = length(google_compute_disk.pd) > 0 ? google_compute_disk.pd[0].self_link : null
}
