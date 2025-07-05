// private google access resource

// GCP Private Google Access - modular and production-grade

resource "google_compute_subnetwork" "private_access" {
  name                     = local.subnet_name
  region                   = local.region
  project                  = local.project_id
  network                  = local.vpc_network_id
  ip_cidr_range            = local.ip_cidr_range
  private_ip_google_access = local.private_google_access
  // Other subnet arguments as needed
}

output "private_access_enabled" {
  description = "Whether Private Google Access is enabled."
  value       = google_compute_subnetwork.private_access.private_ip_google_access
}
