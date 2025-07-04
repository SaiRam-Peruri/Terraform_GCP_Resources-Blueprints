// GCP Cloud Scheduler Job - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the scheduler job."
  type        = string
}

variable "schedule" {
  description = "The cron schedule for the job."
  type        = string
}

variable "pubsub_topic" {
  description = "The Pub/Sub topic to publish to."
  type        = string
}

variable "payload" {
  description = "The payload to send to the Pub/Sub topic."
  type        = string
  default     = null
}

variable "time_zone" {
  description = "The time zone to use for the scheduler job."
  type        = string
  default     = "UTC"
}

variable "http_target" {
  description = "Map of HTTP target settings (url, http_method, headers, body). If set, job will use HTTP target instead of Pub/Sub."
  type        = any
  default     = null
}

variable "retry_config" {
  description = "Retry configuration for the job. Should be a map with optional fields: retry_count, max_retry_duration, min_backoff_duration, max_backoff_duration, max_doublings."
  type        = any
  default     = null
}

resource "google_cloud_scheduler_job" "default" {
  name        = var.name
  project     = var.project_id
  schedule    = var.schedule
  time_zone   = var.time_zone

  dynamic "pubsub_target" {
    for_each = var.http_target == null ? [1] : []
    content {
      topic_name = var.pubsub_topic
      data       = var.payload != null ? base64encode(var.payload) : null
    }
  }

  dynamic "http_target" {
    for_each = var.http_target != null ? [1] : []
    content {
      uri         = var.http_target.url
      http_method = lookup(var.http_target, "http_method", "POST")
      headers     = lookup(var.http_target, "headers", null)
      body        = lookup(var.http_target, "body", null)
    }
  }

  dynamic "retry_config" {
    for_each = var.retry_config != null ? [1] : []
    content {
      retry_count           = lookup(var.retry_config, "retry_count", null)
      max_retry_duration    = lookup(var.retry_config, "max_retry_duration", null)
      min_backoff_duration  = lookup(var.retry_config, "min_backoff_duration", null)
      max_backoff_duration  = lookup(var.retry_config, "max_backoff_duration", null)
      max_doublings         = lookup(var.retry_config, "max_doublings", null)
    }
  }
}

output "scheduler_job_id" {
  description = "The ID of the created Cloud Scheduler job."
  value       = google_cloud_scheduler_job.default.id
}

output "scheduler_job_name" {
  description = "The name of the created Cloud Scheduler job."
  value       = google_cloud_scheduler_job.default.name
}

output "scheduler_job_state" {
  description = "The current state of the Cloud Scheduler job."
  value       = google_cloud_scheduler_job.default.state
}
