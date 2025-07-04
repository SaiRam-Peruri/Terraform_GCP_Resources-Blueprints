// bucket iam resource

// GCP Storage Bucket IAM - modular and production-grade

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "role" {
  description = "The IAM role to assign."
  type        = string
}

variable "member" {
  description = "The member to bind to the role."
  type        = string
}

resource "google_storage_bucket_iam_member" "binding" {
  bucket = var.bucket_name
  role   = var.role
  member = var.member
}

output "bucket_iam_binding_id" {
  description = "The ID of the created bucket IAM binding."
  value       = google_storage_bucket_iam_member.binding.id
}
