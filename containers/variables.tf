// Variables for containers modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "network_id" {
  description = "The VPC network ID for the cluster."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the cluster."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
  default     = "default-pool"
}

variable "node_count" {
  description = "The number of nodes in the node pool."
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for nodes."
  type        = string
  default     = "e2-medium"
}

variable "http_load_balancing" {
  description = "Enable HTTP load balancing addon."
  type        = bool
  default     = true
}

variable "horizontal_pod_autoscaling" {
  description = "Enable horizontal pod autoscaling addon."
  type        = bool
  default     = true
}
