// GCP Storage Bucket Lifecycle - modular and production-grade

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "location" {
  description = "The location where the storage bucket will be created."
  type        = string
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  // This assumes the bucket is managed in the same module. Otherwise, use a data source.
}

resource "google_storage_bucket_lifecycle_rule" "lifecycle" {
  bucket = google_storage_bucket.bucket.name

  action {
    type = "Delete"
  }

  condition {
    age = 30 # Delete objects older than 30 days
  }
}

output "lifecycle_rule_id" {
  description = "The ID of the created lifecycle rule."
  value       = google_storage_bucket_lifecycle_rule.lifecycle.id
}
