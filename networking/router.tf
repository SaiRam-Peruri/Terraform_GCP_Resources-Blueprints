// router resource

// GCP Cloud Router - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the router."
  type        = string
}

variable "router_name" {
  description = "The name of the Cloud Router."
  type        = string
}

variable "network_id" {
  description = "The VPC network ID to associate with this router."
  type        = string
}

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.network_id
  project = var.project_id
  // Add BGP, interfaces, etc. as needed
}

output "router_id" {
  description = "The ID of the created Cloud Router."
  value       = google_compute_router.router.id
}
