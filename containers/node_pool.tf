// GCP GKE Node Pool - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the node pool."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the pool."
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for nodes."
  type        = string
  default     = "e2-medium"
}

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
