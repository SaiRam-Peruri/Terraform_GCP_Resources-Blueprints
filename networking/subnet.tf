// GCP Subnetwork - modular and production-grade

variable "project_id" {
  description = "The GCP project ID to deploy the subnet."
  type        = string
}

variable "region" {
  description = "The region for the subnet."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork."
  type        = string
}

variable "ip_cidr_range" {
  description = "The primary IP CIDR range for the subnet."
  type        = string
}

variable "vpc_network_id" {
  description = "The VPC network ID to associate with this subnet."
  type        = string
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.vpc_network_id
  project       = var.project_id
  // Add secondary ranges, private access, etc. as needed
}

output "subnet_id" {
  description = "The ID of the created subnetwork."
  value       = google_compute_subnetwork.subnet.id
}