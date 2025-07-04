// GCP Managed Instance Group - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the instance group."
  type        = string
}

variable "group_name" {
  description = "The name of the managed instance group."
  type        = string
}

variable "base_instance_name" {
  description = "The base name for instances."
  type        = string
}

variable "instance_template" {
  description = "The self_link of the instance template."
  type        = string
}

variable "target_size" {
  description = "The number of instances in the group."
  type        = number
  default     = 1
}

resource "google_compute_region_instance_group_manager" "mig" {
  name               = var.group_name
  base_instance_name = var.base_instance_name
  region             = var.region
  project            = var.project_id
  version {
    instance_template = var.instance_template
  }
  target_size = var.target_size
  // Add autohealing, named ports, etc. as needed
}

output "mig_id" {
  description = "The ID of the created managed instance group."
  value       = google_compute_region_instance_group_manager.mig.id
}
