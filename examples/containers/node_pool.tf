// GCP GKE Node Pool - modular and production-grade

resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  project    = var.project_id
  location   = var.region
  cluster    = var.cluster_name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}

output "node_pool_id" {
  description = "The ID of the created node pool."
  value       = google_container_node_pool.node_pool.id
}
