// cloud function resource

// GCP Cloud Function - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the Cloud Function."
  type        = string
}

variable "function_name" {
  description = "The name of the Cloud Function."
  type        = string
}

variable "entry_point" {
  description = "The name of the function (as defined in source code) that will be executed."
  type        = string
}

variable "runtime" {
  description = "The runtime in which the function will run."
  type        = string
  default     = "python39"
}

variable "source_archive_bucket" {
  description = "The bucket containing the function source code."
  type        = string
}

variable "source_archive_object" {
  description = "The object in the bucket containing the source code."
  type        = string
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

resource "google_cloudfunctions_function" "function" {
  name        = var.function_name
  project     = var.project_id
  region      = var.region
  runtime     = var.runtime
  entry_point = var.entry_point

  source_archive_bucket = var.source_archive_bucket
  source_archive_object = var.source_archive_object

  trigger_http = var.trigger_http
  available_memory_mb = 256
  environment_variables = var.environment_variables
  vpc_connector         = var.vpc_connector
  ingress_settings      = var.ingress_settings

  dynamic "event_trigger" {
    for_each = var.trigger_http ? [] : [1]
    content {
      event_type = var.event_trigger.event_type
      resource   = var.event_trigger.resource
      failure_policy {
        retry = lookup(var.event_trigger, "failure_policy", false)
      }
    }
  }
}

output "cloud_function_name" {
  description = "The name of the created Cloud Function."
  value       = google_cloudfunctions_function.function.name
}

output "cloud_function_url" {
  description = "The HTTPS URL trigger for the function (if HTTP triggered)."
  value       = var.trigger_http ? google_cloudfunctions_function.function.https_trigger_url : null
}

output "cloud_function_service_account_email" {
  description = "The service account email used by the function."
  value       = google_cloudfunctions_function.function.service_account_email
}
