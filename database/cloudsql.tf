// cloudsql resource

// GCP Cloud SQL Instance (Postgres/MySQL) - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "database_version" {
  description = "The database version (e.g., POSTGRES_14, MYSQL_8_0)."
  type        = string
}

variable "region" {
  description = "The region for the instance."
  type        = string
}

variable "tier" {
  description = "The machine type to use."
  type        = string
  default     = "db-f1-micro"
}

variable "root_password" {
  description = "The root password for the database."
  type        = string
  sensitive   = true
}

resource "google_sql_database_instance" "default" {
  name             = var.name
  project          = var.project_id
  region           = var.region
  database_version = var.database_version

  settings {
    tier = var.tier
  }

  root_password = var.root_password
}

output "cloudsql_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = google_sql_database_instance.default.connection_name
}
