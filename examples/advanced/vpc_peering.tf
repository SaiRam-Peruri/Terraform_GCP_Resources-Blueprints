// GCP VPC Network Peering - modular and production-grade
// Only creates resources when enable_vpc_peering is true

resource "google_compute_network_peering" "peering1" {
  count        = var.enable_vpc_peering ? 1 : 0
  name         = "${var.network_name}-to-${var.peer_network_name}"
  network      = "projects/${var.project_id}/global/networks/${var.network_name}"
  peer_network = "projects/${var.peer_project_id}/global/networks/${var.peer_network_name}"
}

resource "google_compute_network_peering" "peering2" {
  count        = var.enable_vpc_peering ? 1 : 0
  name         = "${var.peer_network_name}-to-${var.network_name}"
  network      = "projects/${var.peer_project_id}/global/networks/${var.peer_network_name}"
  peer_network = "projects/${var.project_id}/global/networks/${var.network_name}"
}

output "vpc_peering1_name" {
  description = "The name of the first VPC peering connection."
  value       = var.enable_vpc_peering ? google_compute_network_peering.peering1[0].name : null
}

output "vpc_peering2_name" {
  description = "The name of the second VPC peering connection."
  value       = var.enable_vpc_peering ? google_compute_network_peering.peering2[0].name : null
}
