// GCP Storage Bucket IAM - modular and production-grade

resource "google_storage_bucket_iam_member" "binding" {
  count  = var.bucket_iam_member != null && var.bucket_iam_role != null ? 1 : 0
  bucket = google_storage_bucket.bucket.name
  role   = var.bucket_iam_role
  member = var.bucket_iam_member
}

output "bucket_iam_binding_id" {
  description = "The ID of the created bucket IAM binding."
  value       = length(google_storage_bucket_iam_member.binding) > 0 ? google_storage_bucket_iam_member.binding[0].id : null
}
