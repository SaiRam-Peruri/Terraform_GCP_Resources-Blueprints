// GCP GKE Cluster - modular and production-grade

resource "google_container_cluster" "gke" {
  name       = var.cluster_name
  project    = var.project_id
  location   = var.region
  network    = var.network_id
  subnetwork = var.subnet_id

  remove_default_node_pool = true
  initial_node_count       = 1
  // Add master_auth, logging, monitoring, etc. as needed
}

output "gke_cluster_id" {
  description = "The ID of the created GKE cluster."
  value       = google_container_cluster.gke.id
}
