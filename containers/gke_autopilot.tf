// GCP GKE Autopilot Cluster - modular and production-grade

resource "google_container_cluster" "autopilot" {
  name       = var.cluster_name
  project    = var.project_id
  location   = var.region
  network    = var.network_id
  subnetwork = var.subnet_id

  enable_autopilot = true
  // Add logging, monitoring, etc. as needed
}

output "gke_autopilot_cluster_id" {
  description = "The ID of the created GKE Autopilot cluster."
  value       = google_container_cluster.autopilot.id
}
