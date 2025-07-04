output "public_ip" {
  description = "The public IP address of the instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "allow_ssh" {
  description = "Firewall rule to allow SSH access"
  value       = google_compute_firewall.allow_ssh.id
}

output "ports" {
  description = "Ports allowed by the firewall rule"
  value       = [for a in google_compute_firewall.allow_ssh.allow : a.ports]
  sensitive   = false
}

output "vpc_network_id" {
  description = "The ID of the VPC network."
  value       = module.vpc.vpc_network_id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = module.subnet.subnet_id
}

output "firewall_rule_id" {
  description = "The ID of the firewall rule."
  value       = module.firewall.firewall_rule_id
}

output "cloud_function_url" {
  description = "The HTTPS URL of the deployed Cloud Function."
  value       = module.cloud_function.cloud_function_url
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke_cluster.gke_cluster_name
}

output "cloudsql_instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = module.cloudsql.cloudsql_instance_connection_name
}

output "storage_bucket_name" {
  description = "The name of the storage bucket."
  value       = module.bucket.storage_bucket_name
}

output "pubsub_topic_id" {
  description = "The ID of the Pub/Sub topic."
  value       = module.pubsub_topic.pubsub_topic_id
}

output "pubsub_subscription_id" {
  description = "The ID of the Pub/Sub subscription."
  value       = module.pubsub_subscription.pubsub_subscription_id
}

output "scheduler_job_name" {
  description = "The name of the Cloud Scheduler job."
  value       = module.cloud_scheduler.scheduler_job_name
}

output "kms_crypto_key_id" {
  description = "The ID of the KMS crypto key."
  value       = module.kms.kms_crypto_key_id
}

output "secret_manager_secret_id" {
  description = "The ID of the Secret Manager secret."
  value       = module.secrets_manager.secret_manager_secret_id
}