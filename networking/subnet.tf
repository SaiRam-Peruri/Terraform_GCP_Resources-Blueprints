// GCP Subnetwork - modular and production-grade

resource "google_compute_subnetwork" "subnet" {
  count         = var.subnet_name != null ? 1 : 0
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
  project       = var.project_id

  description = "Subnet managed by Terraform"

  private_ip_google_access = true
}

output "subnet_id" {
  description = "The ID of the created subnetwork."
  value       = length(google_compute_subnetwork.subnet) > 0 ? google_compute_subnetwork.subnet[0].id : null
}

output "subnet_self_link" {
  description = "The self link of the created subnetwork."
  value       = length(google_compute_subnetwork.subnet) > 0 ? google_compute_subnetwork.subnet[0].self_link : null
}