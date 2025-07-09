// Root-level outputs for production GCP Terraform project
// All outputs reference module outputs, not direct resources

// Networking Outputs
output "vpc_network_id" {
  description = "The ID of the VPC network"
  value       = module.networking.vpc_network_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.networking.subnet_id
}

output "firewall_rule_id" {
  description = "The ID of the firewall rule"
  value       = module.networking.firewall_rule_id
}

// Compute Outputs
output "vm_instance_id" {
  description = "The ID of the VM instance"
  value       = module.compute.vm_instance_id
}

output "vm_public_ip" {
  description = "The public IP address of the VM instance"
  value       = module.compute.vm_external_ip
}

// Storage Outputs
output "storage_bucket_name" {
  description = "The name of the storage bucket"
  value       = module.storage.bucket_name
}

output "storage_bucket_url" {
  description = "The URL of the storage bucket"
  value       = module.storage.bucket_url
}

// IAM Outputs
output "service_account_email" {
  description = "The email of the service account"
  value       = module.iam.service_account_email
}

output "service_account_id" {
  description = "The ID of the service account"
  value       = module.iam.service_account_id
}

// Serverless Outputs
output "cloud_function_url" {
  description = "The HTTPS URL of the deployed Cloud Function"
  value       = module.serverless.cloud_function_url
}

output "cloud_run_url" {
  description = "The URL of the Cloud Run service"
  value       = module.serverless.cloud_run_url
}

// Database Outputs
output "cloudsql_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = module.database.cloudsql_connection_name
}

output "bigquery_dataset_id" {
  description = "The ID of the BigQuery dataset"
  value       = module.database.bigquery_dataset_id
}

output "redis_instance_host" {
  description = "The host of the Redis instance"
  value       = module.database.memorystore_instance_host
}

// Monitoring Outputs
output "monitoring_alert_policy_id" {
  description = "The ID of the monitoring alert policy"
  value       = module.monitoring.alert_policy_id
}

output "log_sink_writer_identity" {
  description = "The writer identity of the log sink"
  value       = module.monitoring.log_sink_writer_identity
}

// Additional module outputs are available when modules are enabled
// TODO: Uncomment when containers, devops, scheduler_messaging, and advanced modules are enabled

/*
// Container Outputs
output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.containers.gke_cluster_name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = module.containers.gke_cluster_endpoint
}

// DevOps Outputs
output "artifact_registry_id" {
  description = "The ID of the Artifact Registry repository"
  value       = module.devops.artifact_registry_id
}

output "cloudbuild_trigger_id" {
  description = "The ID of the Cloud Build trigger"
  value       = module.devops.cloudbuild_trigger_id
}

// Scheduler & Messaging Outputs
output "pubsub_topic_id" {
  description = "The ID of the Pub/Sub topic"
  value       = module.scheduler_messaging.pubsub_topic_id
}

output "pubsub_subscription_id" {
  description = "The ID of the Pub/Sub subscription"
  value       = module.scheduler_messaging.pubsub_subscription_id
}

output "scheduler_job_name" {
  description = "The name of the Cloud Scheduler job"
  value       = module.scheduler_messaging.scheduler_job_name
}

// Advanced Feature Outputs
output "kms_crypto_key_id" {
  description = "The ID of the KMS crypto key"
  value       = module.advanced.kms_crypto_key_id
}

output "secret_manager_secret_id" {
  description = "The ID of the Secret Manager secret"
  value       = module.advanced.secret_manager_secret_id
}

output "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection"
  value       = module.advanced.vpc_peering_connection_id
}
*/