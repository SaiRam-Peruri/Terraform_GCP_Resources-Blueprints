// GCP External IP Address - modular and production-grade

resource "google_compute_address" "external_ip" {
  count       = var.ip_name != null ? 1 : 0
  name        = var.ip_name
  region      = var.region
  project     = var.project_id
  description = "External IP managed by Terraform"
}

output "external_ip_address" {
  description = "The external IP address."
  value       = length(google_compute_address.external_ip) > 0 ? google_compute_address.external_ip[0].address : null
}

output "external_ip_id" {
  description = "The ID of the external IP address."
  value       = length(google_compute_address.external_ip) > 0 ? google_compute_address.external_ip[0].id : null
}
