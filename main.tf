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

// Storage
module "storage" {
  source             = "./storage"
  project_id         = var.project_id
  bucket_name        = var.bucket_name
  location           = var.region
  force_destroy      = false
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

// Note: Additional modules are available but commented out pending variable consolidation
// TODO: Uncomment and configure containers, devops, scheduler_messaging, and advanced modules
// when their variables are properly consolidated

/*
// Containers
module "containers" {
  source       = "./containers"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.gke_name
  network_id   = module.networking.vpc_id
  subnet_id    = module.networking.subnet_id
  node_pool_name = "${var.gke_name}-nodes"
}

// DevOps
module "devops" {
  source        = "./devops"
  project_id    = var.project_id
  location      = var.region
  name          = var.devops_name
  trigger_name  = "${var.devops_name}-trigger"
  owner         = var.github_owner
  repo_name     = var.github_repo
  repository_id = var.source_repo_id
}

// Scheduler & Messaging
module "scheduler_messaging" {
  source            = "./scheduler_messaging"
  project_id        = var.project_id
  name              = var.scheduler_name
  topic_name        = "${var.scheduler_name}-topic"
  subscription_name = "${var.scheduler_name}-sub"
  schedule          = var.scheduler_cron
  topic             = var.pubsub_topic
  pubsub_topic      = var.pubsub_topic
}

// Advanced Features (KMS, Secrets, VPC Peering, etc.)
module "advanced" {
  source               = "./advanced"
  project_id           = var.project_id
  region               = var.region
  service_project_id   = var.project_id
  crypto_key_name      = "${var.advanced_name}-key"
  access_policy_title  = "${var.advanced_name}-policy"
}
*/
