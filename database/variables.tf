// Variables for database modules - consolidated from all database resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "location" {
  description = "The GCP location (alias for region)."
  type        = string
  default     = null
}

variable "location_id" {
  description = "The location ID for Firestore/Datastore."
  type        = string
  default     = null
}

variable "name" {
  description = "The base name for database resources."
  type        = string
}

// Cloud SQL variables
variable "cloudsql_instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
  default     = null
}

variable "database_version" {
  description = "The database version (e.g., POSTGRES_14, MYSQL_8_0)."
  type        = string
  default     = "POSTGRES_14"
}

variable "tier" {
  description = "The machine type to use for Cloud SQL."
  type        = string
  default     = "db-f1-micro"
}

variable "root_password" {
  description = "The root password for the database."
  type        = string
  default     = null
  sensitive   = true
}

// BigQuery variables
variable "dataset_id" {
  description = "The ID of the BigQuery dataset."
  type        = string
  default     = null
}

variable "description" {
  description = "A description for the BigQuery dataset."
  type        = string
  default     = "Managed by Terraform"
}

// Firestore variables
variable "firestore_type" {
  description = "The type of Firestore database."
  type        = string
  default     = "FIRESTORE_NATIVE"
}

// Memorystore variables
variable "memorystore_name" {
  description = "The name of the Memorystore instance."
  type        = string
  default     = null
}

variable "memory_size_gb" {
  description = "The memory size for Memorystore instance in GB."
  type        = number
  default     = 1
}

variable "redis_tier" {
  description = "The service tier for Redis (BASIC or STANDARD_HA)."
  type        = string
  default     = "BASIC"
}
