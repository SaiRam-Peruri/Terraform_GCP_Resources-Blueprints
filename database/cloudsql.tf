// cloudsql resource

// GCP Cloud SQL Instance (Postgres/MySQL) - modular and production-grade

resource "google_sql_database_instance" "default" {
  name                = local.cloudsql_instance_name
  project             = local.project_id
  region              = local.region
  database_version    = local.database_version
  deletion_protection = false # Temporarily disabled for destroy operation

  settings {
    tier = local.tier
  }

  root_password = local.root_password
}

output "cloudsql_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = google_sql_database_instance.default.connection_name
}
