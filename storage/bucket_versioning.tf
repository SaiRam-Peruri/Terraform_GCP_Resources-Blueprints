// GCP Storage Bucket Versioning - modular and production-grade

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  // This assumes the bucket is managed in the same module. Otherwise, use a data source.

  versioning {
    enabled = true
  }
}

output "bucket_versioning_enabled" {
  description = "Whether versioning is enabled on the bucket."
  value       = google_storage_bucket.bucket.versioning[0].enabled
}
