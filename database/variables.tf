// Variables for database modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the database resource."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}
