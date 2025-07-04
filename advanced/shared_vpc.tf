// GCP Shared VPC Host Project and Service Project Attachment - modular and production-grade

variable "host_project_id" {
  description = "The project ID of the Shared VPC host."
  type        = string
}

variable "service_project_id" {
  description = "The project ID of the service project to attach."
  type        = string
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}

resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = var.host_project_id
  service_project = var.service_project_id
}

output "shared_vpc_host_project_id" {
  description = "The ID of the Shared VPC host project."
  value       = google_compute_shared_vpc_host_project.host.project
}

output "shared_vpc_service_project_id" {
  description = "The ID of the attached service project."
  value       = google_compute_shared_vpc_service_project.service.service_project
}
