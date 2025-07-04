// GCP External IP Address - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the external IP."
  type        = string
}

variable "ip_name" {
  description = "The name of the external IP address."
  type        = string
}

resource "google_compute_address" "external_ip" {
  name    = var.ip_name
  region  = var.region
  project = var.project_id
}

output "external_ip_address" {
  description = "The reserved external IP address."
  value       = google_compute_address.external_ip.address
}
