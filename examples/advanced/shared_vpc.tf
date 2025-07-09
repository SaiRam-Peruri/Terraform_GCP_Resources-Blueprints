// GCP Shared VPC Host Project and Service Project Attachment - modular and production-grade
// Only creates resources when enable_shared_vpc is true

resource "google_compute_shared_vpc_host_project" "host" {
  count   = var.enable_shared_vpc ? 1 : 0
  project = var.host_project_id
}

resource "google_compute_shared_vpc_service_project" "service" {
  count           = var.enable_shared_vpc ? 1 : 0
  host_project    = var.host_project_id
  service_project = var.project_id
}

output "shared_vpc_host_project_id" {
  description = "The ID of the Shared VPC host project."
  value       = var.enable_shared_vpc ? google_compute_shared_vpc_host_project.host[0].project : null
}

output "shared_vpc_service_project_id" {
  description = "The ID of the attached service project."
  value       = var.enable_shared_vpc ? google_compute_shared_vpc_service_project.service[0].service_project : null
}
