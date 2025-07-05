// Variables for IAM modules - consolidated from all IAM resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

// Service Account variables
variable "account_id" {
  description = "The service account ID (must be unique within the project)."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = string
}

variable "description" {
  description = "The description for the service account."
  type        = string
  default     = "Service account managed by Terraform"
}

// Custom role variables
variable "role_id" {
  description = "The ID of the custom role."
  type        = string
  default     = null
}

variable "title" {
  description = "The title of the custom role."
  type        = string
  default     = null
}

variable "permissions" {
  description = "The list of permissions for the custom role."
  type        = list(string)
  default     = []
}

variable "stage" {
  description = "The development stage of the custom role."
  type        = string
  default     = "GA"
}

// IAM binding variables
variable "role" {
  description = "The IAM role to bind."
  type        = string
  default     = null
}

variable "members" {
  description = "List of members to bind to the role."
  type        = list(string)
  default     = []
}

// Workload identity variables
variable "pool_id" {
  description = "The workload identity pool ID."
  type        = string
  default     = null
}

// Audit logging variables
variable "service" {
  description = "The service for audit logging."
  type        = string
  default     = null
}

variable "log_types" {
  description = "The log types for audit logging."
  type        = list(string)
  default     = []
}
