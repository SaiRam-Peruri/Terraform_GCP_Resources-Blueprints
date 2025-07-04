// nat gateway resource

// GCP NAT Gateway - placeholder for production use

# Google Cloud does not have a direct NAT Gateway resource. Use Cloud NAT with a router.

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the NAT gateway."
  type        = string
}

variable "router_name" {
  description = "The name of the Cloud Router for NAT."
  type        = string
}

variable "nat_name" {
  description = "The name of the Cloud NAT."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork to use for NAT."
  type        = string
}

resource "google_compute_router" "nat_router" {
  name    = var.router_name
  region  = var.region
  network = var.subnet_name
  project = var.project_id
}

resource "google_compute_router_nat" "nat_gateway" {
  name                               = var.nat_name
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  project                            = var.project_id
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  // Add log_config, timeouts, etc. as needed
}

output "nat_gateway_name" {
  description = "The name of the created Cloud NAT gateway."
  value       = google_compute_router_nat.nat_gateway.name
}
