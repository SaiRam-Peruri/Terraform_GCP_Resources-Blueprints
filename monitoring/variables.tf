variable "project_id" { type = string }
variable "alert_policy_display_name" { type = string }
variable "display_name" { type = string }
variable "destination" { type = string }
variable "labels" { type = map(string) }
variable "type" { type = string }
variable "sink_name" { type = string }
variable "host" { type = string }
variable "conditions" { type = list(any) }
variable "uptime_check_name" { type = string }

variable "notification_channels" {
  description = "List of notification channel IDs."
  type        = list(string)
  default     = []
}

variable "filter" {
  description = "An advanced logs filter."
  type        = string
  default     = null
}

variable "path" {
  description = "The path to check (for HTTP)."
  type        = string
  default     = "/"
}
