// Variables for devops modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location" {
  description = "The location for DevOps resources."
  type        = string
}

variable "name" {
  description = "The name of the devops resource."
  type        = string
}

variable "trigger_name" {
  description = "The name of the build trigger."
  type        = string
}

variable "owner" {
  description = "The GitHub repository owner."
  type        = string
}

variable "repo_name" {
  description = "The repository name."
  type        = string
}

variable "repository_id" {
  description = "The repository ID for Artifact Registry."
  type        = string
}

variable "branch_regex" {
  description = "The branch regex for triggers."
  type        = string
  default     = "^main$"
}

variable "build_config_path" {
  description = "The path to the Cloud Build configuration file."
  type        = string
  default     = "cloudbuild.yaml"
}

variable "format" {
  description = "The format for Artifact Registry."
  type        = string
  default     = "DOCKER"
}
