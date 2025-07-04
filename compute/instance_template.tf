// GCP Instance Template - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "template_name" {
  description = "The name of the instance template."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the template."
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "The image for the boot disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network_id" {
  description = "The VPC network ID."
  type        = string
}

variable "subnet_id" {
  description = "The subnetwork ID."
  type        = string
}

resource "google_compute_instance_template" "default" {
  name         = var.template_name
  project      = var.project_id
  machine_type = var.machine_type

  disk {
    source_image = var.boot_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
  }
  // Add metadata, service account, tags, etc. as needed
}

output "instance_template_id" {
  description = "The ID of the created instance template."
  value       = google_compute_instance_template.default.id
}
