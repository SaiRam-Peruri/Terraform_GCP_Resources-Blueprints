// Root main.tf to orchestrate all modules in a production GCP Terraform project

// Enable required APIs (apis/required_api's.tf)
module "required_apis" {
  source     = "./apis"
  project_id = var.project_id
  name       = var.project_name
}

// Networking (Fixed: Variables consolidated, removed duplicates)
module "networking" {
  source     = "./networking"
  project_id = var.project_id
  vpc_name   = var.vpc_name
  region     = var.region
}

// Compute
module "compute" {
  source       = "./compute"
  project_id   = var.project_id
  vm_name      = var.vm_name
  zone         = var.zone
  region       = var.region
  machine_type = "e2-micro"
  boot_image   = "debian-cloud/debian-11"
  network_id   = "default"
  subnet_id    = null
}

// Storage - Project bucket (separate from state bucket)
module "storage" {
  source             = "./storage"
  project_id         = var.project_id
  bucket_name        = var.bucket_name
  location           = var.region
  force_destroy      = false # Production setting - prevents accidental deletion
  versioning_enabled = true
}

// IAM
module "iam" {
  source       = "./iam"
  project_id   = var.project_id
  account_id   = var.sa_name
  display_name = "Terraform managed service account"
  description  = "Service account created by Terraform for GCP resources"
  service      = var.iam_service
  log_types    = var.iam_log_types
}

// Serverless (Fixed: Variables consolidated, removed duplicates)
module "serverless" {
  source     = "./serverless"
  project_id = var.project_id
  name       = var.function_name
  region     = var.region
}

// Database (Fixed: Variables consolidated, removed duplicates)
module "database" {
  source     = "./database"
  project_id = var.project_id
  name       = var.db_name
  region     = var.region
  redis_tier = var.redis_tier
}

// Monitoring (depends on storage bucket)
module "monitoring" {
  source                    = "./monitoring"
  project_id                = var.project_id
  alert_policy_display_name = var.alert_policy_display_name
  display_name              = var.monitoring_display_name
  destination               = "storage.googleapis.com/${module.storage.bucket_name}"
  labels                    = var.monitoring_labels
  type                      = var.monitoring_type
  sink_name                 = var.monitoring_sink_name
  host                      = var.monitoring_host
  conditions                = var.monitoring_conditions
  uptime_check_name         = var.monitoring_uptime_check_name
  
  # Ensure storage bucket is created before logging sink
  depends_on = [module.storage]
}

