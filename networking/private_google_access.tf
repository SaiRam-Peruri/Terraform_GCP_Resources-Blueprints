// private google access resource

// GCP Private Google Access - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the subnetwork."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork."
  type        = string
}

variable "private_google_access" {
  description = "Enable Private Google Access for the subnet."
  type        = bool
  default     = true
}

variable "vpc_network_id" {
  description = "The ID of the VPC network."
  type        = string
}

resource "google_compute_subnetwork" "private_access" {
  name          = var.subnet_name
  region        = var.region
  project       = var.project_id
  network       = var.vpc_network_id
  private_ip_google_access = var.private_google_access
  // Other subnet arguments as needed
}

output "private_access_enabled" {
  description = "Whether Private Google Access is enabled."
  value       = google_compute_subnetwork.private_access.private_ip_google_access
}
