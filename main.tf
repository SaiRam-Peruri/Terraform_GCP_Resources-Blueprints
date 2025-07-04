// Root main.tf to orchestrate all modules in a production GCP Terraform project

provider "google" {
  project = var.project_id
  region  = var.region
}

// Enable required APIs (provider/required_api's.tf)
module "required_apis" {
  source     = "./provider"
  project_id = var.project_id
  name       = var.project_name
}

// Networking
module "vpc" {
  source     = "./networking/vpc"
  project_id = var.project_id
  name       = var.vpc_name
  region     = var.region
}

// Compute
module "compute_vm" {
  source     = "./compute/vm"
  project_id = var.project_id
  name       = var.vm_name
  zone       = var.zone
}

// Storage
module "storage_bucket" {
  source     = "./storage/bucket"
  project_id = var.project_id
  name       = var.bucket_name
  location   = var.region
}

// IAM
module "service_account" {
  source     = "./iam/service_account"
  project_id = var.project_id
  name       = var.sa_name
}

// Serverless
module "cloud_function" {
  source     = "./serverless/cloud_function"
  project_id = var.project_id
  name       = var.function_name
  region     = var.region
}

// Database
module "cloudsql" {
  source     = "./database/cloudsql"
  project_id = var.project_id
  name       = var.db_name
  region     = var.region
}

// Monitoring
module "monitoring" {
  source                    = "./monitoring"
  project_id                = var.project_id
  alert_policy_display_name = var.alert_policy_display_name
  display_name              = var.monitoring_display_name
  destination               = var.monitoring_destination
  labels                    = var.monitoring_labels
  type                      = var.monitoring_type
  sink_name                 = var.monitoring_sink_name
  host                      = var.monitoring_host
  conditions                = var.monitoring_conditions
  uptime_check_name         = var.monitoring_uptime_check_name
}

// Add additional modules for each resource type as needed
// e.g., devops, containers, advanced, scheduler_messaging, outputs, etc.

// Example for advanced/secrets_manager
module "secrets_manager" {
  source      = "./advanced/secrets_manager"
  project_id  = var.project_id
  secret_id   = var.secret_id
  secret_data = var.secret_data
}
