// Variables for compute modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the compute resource."
  type        = string
}

variable "zone" {
  description = "The GCP zone."
  type        = string
}
