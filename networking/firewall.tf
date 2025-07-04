// GCP Firewall Rule - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "firewall_name" {
  description = "The name of the firewall rule."
  type        = string
}

variable "network_id" {
  description = "The VPC network ID to associate with this firewall."
  type        = string
}

variable "source_ranges" {
  description = "List of source CIDR ranges allowed."
  type        = list(string)
}

variable "target_tags" {
  description = "List of target tags for the firewall rule."
  type        = list(string)
  default     = []
}

resource "google_compute_firewall" "allow_ssh" {
  name    = var.firewall_name
  network = var.network_id
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
  description   = "Allow SSH access from defined source ranges"
}

output "firewall_rule_id" {
  description = "The ID of the created firewall rule."
  value       = google_compute_firewall.allow_ssh.id
}