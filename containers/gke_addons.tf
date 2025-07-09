// GCP GKE Addons - modular and production-grade

resource "google_container_cluster" "addons" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region

  addons_config {
    http_load_balancing {
      disabled = !var.http_load_balancing
    }
    horizontal_pod_autoscaling {
      disabled = !var.horizontal_pod_autoscaling
    }
  }
}

output "gke_addons_cluster_id" {
  description = "The ID of the cluster with configured addons."
  value       = google_container_cluster.addons.id
}
