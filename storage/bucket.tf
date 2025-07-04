// GCP Storage Bucket - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "location" {
  description = "The location for the bucket."
  type        = string
  default     = "US"
}

variable "force_destroy" {
  description = "Force destroy objects when deleting the bucket."
  type        = bool
  default     = false
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.location
  force_destroy = var.force_destroy
  // Add versioning, lifecycle rules, IAM, etc. as needed
}

output "bucket_url" {
  description = "The URL of the created storage bucket."
  value       = google_storage_bucket.bucket.url
}
