// Provider-level variables for modular, reusable GCP Terraform modules

variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "region" {
  description = "The GCP region for resources."
  type        = string
  default     = "us-central1"
}

variable "name" {
  description = "A base name used for resource naming conventions."
  type        = string
}

// Add more variables as needed for provider configuration, e.g., credentials, labels, etc.
