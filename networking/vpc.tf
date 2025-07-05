// GCP VPC Network - modular and production-grade

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = var.auto_create_subnetworks

  description = "VPC network managed by Terraform"
}

output "vpc_network_id" {
  description = "The ID of the created VPC network."
  value       = google_compute_network.vpc_network.id
}

output "vpc_network_self_link" {
  description = "The self link of the created VPC network."
  value       = google_compute_network.vpc_network.self_link
}



