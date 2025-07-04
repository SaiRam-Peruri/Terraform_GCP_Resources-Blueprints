// GCP Compute VM Instance - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "zone" {
  description = "The zone to deploy the VM."
  type        = string
}

variable "vm_name" {
  description = "The name of the VM instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM."
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "The image for the VM boot disk."
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

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id
    access_config {}
  }
  // Add metadata, service account, tags, etc. as needed
}

output "vm_instance_id" {
  description = "The ID of the created VM instance."
  value       = google_compute_instance.vm_instance.id
}
