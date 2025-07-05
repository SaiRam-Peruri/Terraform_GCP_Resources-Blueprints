// Main database module file - orchestrates all database resources

// The resources are defined in their respective .tf files in this same directory:
// - cloudsql.tf: Cloud SQL instances
// - bigquery_dataset.tf: BigQuery datasets
// - firestore.tf: Firestore databases
// - datastore.tf: Cloud Datastore
// - memorystore.tf: Memorystore instances
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

locals {
  # Common configuration
  project_id  = var.project_id
  region      = var.region
  location    = var.location != null ? var.location : var.region
  location_id = var.location_id != null ? var.location_id : var.region

  # Base name configuration
  base_name = var.name

  # Cloud SQL configuration
  cloudsql_instance_name = var.cloudsql_instance_name != null ? var.cloudsql_instance_name : "${var.name}-sql"
  database_version       = var.database_version
  tier                   = var.tier
  root_password          = var.root_password

  # BigQuery configuration
  dataset_id  = var.dataset_id != null ? var.dataset_id : "${replace(var.name, "-", "_")}_dataset"
  description = var.description

  # Firestore configuration
  firestore_type = var.firestore_type

  # Memorystore configuration
  memorystore_name = var.memorystore_name != null ? var.memorystore_name : "${var.name}-cache"
  memory_size_gb   = var.memory_size_gb
  redis_tier       = var.redis_tier

  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "database"
  }
}

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf
