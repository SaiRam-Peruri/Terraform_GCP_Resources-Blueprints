// GCP Persistent Disk - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "zone" {
  description = "The zone for the disk."
  type        = string
}

variable "disk_name" {
  description = "The name of the persistent disk."
  type        = string
}

variable "size_gb" {
  description = "The size of the disk in GB."
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The type of the disk (pd-standard, pd-ssd, etc.)."
  type        = string
  default     = "pd-standard"
}

resource "google_compute_disk" "pd" {
  name  = var.disk_name
  zone  = var.zone
  size  = var.size_gb
  type  = var.disk_type
  project = var.project_id
}

output "disk_id" {
  description = "The ID of the created persistent disk."
  value       = google_compute_disk.pd.id
}
