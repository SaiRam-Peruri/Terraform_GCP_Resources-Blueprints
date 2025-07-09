# Advanced Module Variables
# Provides configuration for enterprise security features

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "project_name" {
  description = "The project name used for resource naming"
  type        = string
}

variable "region" {
  description = "The GCP region for regional resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for zonal resources"
  type        = string
  default     = "us-central1-a"
}

# KMS Configuration
variable "kms_location" {
  description = "The location for the KMS key ring"
  type        = string
  default     = "global"
}

# Secret Manager Configuration
variable "secret_data" {
  description = "The secret data to store (for demo purposes)"
  type        = string
  default     = "demo-secret-value"
  sensitive   = true
}

# VPC Peering (optional)
variable "enable_vpc_peering" {
  description = "Whether to enable VPC peering"
  type        = bool
  default     = false
}

variable "network_name" {
  description = "The name of the local VPC network for peering"
  type        = string
  default     = ""
}

variable "peer_project_id" {
  description = "The project ID of the peer VPC (required if enable_vpc_peering is true)"
  type        = string
  default     = ""
}

variable "peer_network_name" {
  description = "The name of the peer VPC network (required if enable_vpc_peering is true)"
  type        = string
  default     = ""
}

# Access Context Manager (optional)
variable "enable_access_context" {
  description = "Whether to enable Access Context Manager"
  type        = bool
  default     = false
}

variable "organization_id" {
  description = "The GCP organization ID (required if enable_access_context is true)"
  type        = string
  default     = ""
}

# Shared VPC (optional)
variable "enable_shared_vpc" {
  description = "Whether to enable Shared VPC configuration"
  type        = bool
  default     = false
}

variable "host_project_id" {
  description = "The host project ID for Shared VPC (required if enable_shared_vpc is true)"
  type        = string
  default     = ""
}
