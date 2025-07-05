// GCP Firewall Rule - modular and production-grade

resource "google_compute_firewall" "allow_ssh" {
  count       = var.firewall_name != null ? 1 : 0
  name        = var.firewall_name
  project     = var.project_id
  network     = google_compute_network.vpc_network.name
  description = "Firewall rule managed by Terraform"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}

output "firewall_rule_id" {
  description = "The ID of the created firewall rule."
  value       = length(google_compute_firewall.allow_ssh) > 0 ? google_compute_firewall.allow_ssh[0].id : null
}