// Variables for serverless modules - consolidated from all serverless resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "location" {
  description = "The GCP location (alias for region)."
  type        = string
  default     = null
}

variable "name" {
  description = "The base name for serverless resources."
  type        = string
}

// Cloud Function variables
variable "function_name" {
  description = "The name of the Cloud Function."
  type        = string
  default     = null
}

variable "entry_point" {
  description = "The name of the function (as defined in source code) that will be executed."
  type        = string
  default     = "main"
}

variable "runtime" {
  description = "The runtime in which the function will run."
  type        = string
  default     = "python39"
}

variable "source_archive_bucket" {
  description = "The bucket containing the function source code."
  type        = string
  default     = null
}

variable "source_archive_object" {
  description = "The object in the bucket containing the source code."
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "A map of environment variables to pass to the function."
  type        = map(string)
  default     = {}
}

variable "vpc_connector" {
  description = "The VPC connector name (if using VPC access)."
  type        = string
  default     = null
}

variable "ingress_settings" {
  description = "Ingress settings for the function."
  type        = string
  default     = "ALLOW_ALL"
}

variable "trigger_http" {
  description = "Whether the function is triggered via HTTP. If false, use event_trigger."
  type        = bool
  default     = true
}

variable "event_trigger" {
  description = "Event trigger block for non-HTTP functions. Should be a map with event_type, resource, and optional failure_policy."
  type        = any
  default     = null
}

// Cloud Run variables
variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
  default     = null
}

variable "image" {
  description = "The container image to deploy."
  type        = string
  default     = "gcr.io/cloudrun/hello"
}

// Cloud Tasks variables
variable "queue_name" {
  description = "The name of the Cloud Tasks queue."
  type        = string
  default     = null
}

// Eventarc variables
variable "trigger_name" {
  description = "The name of the Eventarc trigger."
  type        = string
  default     = null
}

variable "destination_run_service" {
  description = "The Cloud Run service to receive events."
  type        = string
  default     = null
}

variable "event_filters" {
  description = "Event filters for the Eventarc trigger."
  type = list(object({
    attribute = string
    value     = string
  }))
  default = []
}
