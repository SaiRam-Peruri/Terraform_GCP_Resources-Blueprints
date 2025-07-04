// GCP VPC Network - modular and production-grade

variable "project_id" {
  description = "The GCP project ID to deploy the VPC."
  type        = string
}

variable "name" {
  description = "The name of the VPC network."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to create default subnets. Should be false for custom subnets."
  type        = bool
  default     = false
}

resource "google_compute_network" "vpc_network" {
  name                    = var.name
  project                 = var.project_id
  auto_create_subnetworks = var.auto_create_subnetworks
  // Enable flow logs, routing, etc. as needed for production
}

output "vpc_network_id" {
  description = "The ID of the created VPC network."
  value       = google_compute_network.vpc_network.id
}



