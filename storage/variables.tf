// Variables for storage modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the storage resource."
  type        = string
}

variable "location" {
  description = "The GCP location."
  type        = string
}
