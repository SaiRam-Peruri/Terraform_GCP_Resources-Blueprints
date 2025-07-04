// GCP GKE Autopilot Cluster - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the GKE Autopilot cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE Autopilot cluster."
  type        = string
}

variable "network_id" {
  description = "The VPC network ID."
  type        = string
}

variable "subnet_id" {
  description = "The subnetwork ID."
  type        = string
}

resource "google_container_cluster" "autopilot" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region
  network  = var.network_id
  subnetwork = var.subnet_id

  enable_autopilot = true
  // Add logging, monitoring, etc. as needed
}

output "gke_autopilot_cluster_id" {
  description = "The ID of the created GKE Autopilot cluster."
  value       = google_container_cluster.autopilot.id
}
