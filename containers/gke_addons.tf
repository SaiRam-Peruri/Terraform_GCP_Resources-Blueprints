// GCP GKE Addons - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the GKE cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "http_load_balancing" {
  description = "Enable HTTP Load Balancing addon."
  type        = bool
  default     = true
}

variable "horizontal_pod_autoscaling" {
  description = "Enable Horizontal Pod Autoscaling addon."
  type        = bool
  default     = true
}

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
