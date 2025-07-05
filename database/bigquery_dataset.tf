// GCP BigQuery Dataset - modular and production-grade

resource "google_bigquery_dataset" "default" {
  project     = local.project_id
  dataset_id  = local.dataset_id
  location    = local.location
  description = local.description
}

output "bigquery_dataset_id" {
  description = "The ID of the created BigQuery dataset."
  value       = google_bigquery_dataset.default.id
}
