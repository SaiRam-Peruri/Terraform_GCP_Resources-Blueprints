// GCP Storage Bucket - modular and production-grade

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.location
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning_enabled
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type = lifecycle_rule.value.action.type
      }
      condition {
        age                   = lifecycle_rule.value.condition.age
        created_before        = lifecycle_rule.value.condition.created_before
        with_state            = lifecycle_rule.value.condition.with_state
        matches_storage_class = lifecycle_rule.value.condition.matches_storage_class
      }
    }
  }

  labels = {
    environment = "development"
    managed-by  = "terraform"
  }

  # Prevent accidental deletion of the state bucket
  lifecycle {
    prevent_destroy = true
  }
}

output "bucket_name" {
  description = "The name of the created storage bucket."
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "The URL of the created storage bucket."
  value       = google_storage_bucket.bucket.url
}

output "bucket_self_link" {
  description = "The self link of the created storage bucket."
  value       = google_storage_bucket.bucket.self_link
}
