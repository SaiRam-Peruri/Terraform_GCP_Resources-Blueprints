// Root variables.tf for all required variables in main.tf

variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "project_name" {
  description = "A base name used for resource naming conventions."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources into."
  type        = string
}

variable "zone" {
  description = "The GCP zone to deploy resources into."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "vm_name" {
  description = "The name of the VM instance."
  type        = string
}

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "sa_name" {
  description = "The name of the service account."
  type        = string
}

variable "iam_service" {
  description = "The GCP service to enable audit logging for (e.g., storage.googleapis.com)."
  type        = string
  default     = "storage.googleapis.com"
}

variable "iam_log_types" {
  description = "The types of logs to enable for audit logging (e.g., DATA_READ, DATA_WRITE, ADMIN_READ)."
  type        = list(string)
  default     = ["ADMIN_READ", "DATA_WRITE"]
}

variable "function_name" {
  description = "The name of the Cloud Function."
  type        = string
}

variable "db_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "redis_tier" {
  description = "The Redis tier for Memorystore (BASIC or STANDARD_HA)."
  type        = string
  default     = "BASIC"
}

variable "secret_id" {
  description = "The name of the secret for Secret Manager."
  type        = string
}

variable "secret_data" {
  description = "The secret data for Secret Manager."
  type        = string
  sensitive   = true
}

// Monitoring module variables
variable "alert_policy_display_name" {
  description = "Display name for the alert policy."
  type        = string
}

variable "monitoring_display_name" {
  description = "Display name for monitoring resources."
  type        = string
}

variable "monitoring_destination" {
  description = "Destination for monitoring notifications."
  type        = string
}

variable "monitoring_labels" {
  description = "Labels for monitoring resources."
  type        = map(string)
}

variable "monitoring_type" {
  description = "Type for monitoring resources."
  type        = string
}

variable "monitoring_sink_name" {
  description = "Sink name for monitoring logs."
  type        = string
}

variable "monitoring_host" {
  description = "Host for uptime checks."
  type        = string
}

variable "monitoring_conditions" {
  description = "Conditions for alert policies."
  type        = list(any)
}

variable "monitoring_uptime_check_name" {
  description = "Name for uptime check."
  type        = string
}

// Containers module variables
variable "gke_name" {
  description = "The name of the GKE cluster."
  type        = string
}

// DevOps module variables
variable "devops_name" {
  description = "The name of the DevOps resources."
  type        = string
}

variable "github_owner" {
  description = "The GitHub repository owner."
  type        = string
}

variable "github_repo" {
  description = "The GitHub repository name."
  type        = string
}

variable "source_repo_id" {
  description = "The Cloud Source Repository ID."
  type        = string
}

// Scheduler & Messaging module variables
variable "scheduler_name" {
  description = "The name of the scheduler resources."
  type        = string
}

variable "scheduler_cron" {
  description = "The cron schedule for Cloud Scheduler."
  type        = string
  default     = "0 9 * * 1" # Every Monday at 9 AM
}

variable "pubsub_topic" {
  description = "The name of the Pub/Sub topic."
  type        = string
}

// Advanced module variables
variable "advanced_name" {
  description = "The name prefix for advanced features."
  type        = string
}

// Additional container variables
variable "gke_node_pool_name" {
  description = "The name of the GKE node pool."
  type        = string
}

variable "gke_node_count" {
  description = "The number of nodes in the GKE cluster."
  type        = number
  default     = 1
}

variable "gke_machine_type" {
  description = "The machine type for GKE nodes."
  type        = string
  default     = "e2-medium"
}

// Additional devops variables
variable "devops_location" {
  description = "The location for DevOps resources."
  type        = string
}

variable "devops_repo_name" {
  description = "The DevOps repository name."
  type        = string
}

variable "devops_repository_id" {
  description = "The Artifact Registry repository ID."
  type        = string
}

// Additional scheduler variables
variable "scheduler_topic_name" {
  description = "The name of the scheduler Pub/Sub topic."
  type        = string
}

variable "scheduler_subscription_name" {
  description = "The name of the scheduler Pub/Sub subscription."
  type        = string
}
