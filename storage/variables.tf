// Variables for storage modules - consolidated from all storage resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "location" {
  description = "The GCP location for the bucket."
  type        = string
  default     = "US"
}

variable "force_destroy" {
  description = "Force destroy objects when deleting the bucket."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket."
  type        = bool
  default     = true
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules for the bucket."
  type = list(object({
    action = object({
      type = string
    })
    condition = object({
      age                   = optional(number)
      created_before        = optional(string)
      with_state            = optional(string)
      matches_storage_class = optional(list(string))
    })
  }))
  default = []
}

variable "bucket_iam_role" {
  description = "The IAM role to assign to the bucket."
  type        = string
  default     = null
}

variable "bucket_iam_member" {
  description = "The member to bind to the role (e.g., user:email@domain.com)."
  type        = string
  default     = null
}
