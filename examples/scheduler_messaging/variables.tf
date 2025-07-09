// Variables for scheduler_messaging modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the scheduler resource."
  type        = string
}

variable "topic_name" {
  description = "The name of the Pub/Sub topic."
  type        = string
}

variable "subscription_name" {
  description = "The name of the Pub/Sub subscription."
  type        = string
}

variable "schedule" {
  description = "The cron schedule for Cloud Scheduler."
  type        = string
  default     = "0 9 * * 1"
}

variable "time_zone" {
  description = "The time zone for the scheduler."
  type        = string
  default     = "UTC"
}

variable "topic" {
  description = "The Pub/Sub topic for subscription."
  type        = string
}

variable "pubsub_topic" {
  description = "The Pub/Sub topic name for scheduler target."
  type        = string
}

variable "ack_deadline_seconds" {
  description = "The acknowledgment deadline for subscription."
  type        = number
  default     = 20
}

variable "payload" {
  description = "The payload for the scheduler job."
  type        = string
  default     = null
}

variable "http_target" {
  description = "HTTP target configuration for scheduler."
  type = object({
    url         = string
    http_method = optional(string)
    headers     = optional(map(string))
    body        = optional(string)
  })
  default = null
}
