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

variable "function_name" {
  description = "The name of the Cloud Function."
  type        = string
}

variable "db_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
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
