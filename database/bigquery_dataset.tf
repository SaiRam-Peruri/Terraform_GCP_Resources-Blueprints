// GCP BigQuery Dataset - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "dataset_id" {
  description = "The dataset ID."
  type        = string
}

variable "location" {
  description = "The location for the dataset."
  type        = string
  default     = "US"
}

variable "description" {
  description = "A user-friendly description of the dataset."
  type        = string
  default     = null
}

resource "google_bigquery_dataset" "default" {
  project     = var.project_id
  dataset_id  = var.dataset_id
  location    = var.location
  description = var.description
}

output "bigquery_dataset_id" {
  description = "The ID of the created BigQuery dataset."
  value       = google_bigquery_dataset.default.id
}
