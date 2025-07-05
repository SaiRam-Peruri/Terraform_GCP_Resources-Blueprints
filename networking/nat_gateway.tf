// nat gateway resource

// GCP NAT Gateway - uses existing router

# Google Cloud does not have a direct NAT Gateway resource. Use Cloud NAT with a router.

resource "google_compute_router_nat" "nat_gateway" {
  name                               = local.nat_name
  router                             = google_compute_router.router.name
  region                             = local.region
  project                            = local.project_id
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  // Add log_config, timeouts, etc. as needed
}

output "nat_gateway_name" {
  description = "The name of the created Cloud NAT gateway."
  value       = google_compute_router_nat.nat_gateway.name
}
