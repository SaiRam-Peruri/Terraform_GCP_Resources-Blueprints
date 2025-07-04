// GCP Memorystore (Redis) - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "name" {
  description = "The name of the Redis instance."
  type        = string
}

variable "region" {
  description = "The region for the Redis instance."
  type        = string
}

variable "tier" {
  description = "The service tier (BASIC or STANDARD_HA)."
  type        = string
  default     = "BASIC"
}

variable "memory_size_gb" {
  description = "The memory size in GB."
  type        = number
  default     = 1
}

resource "google_redis_instance" "default" {
  name           = var.name
  project        = var.project_id
  region         = var.region
  tier           = var.tier
  memory_size_gb = var.memory_size_gb
}

output "memorystore_instance_host" {
  description = "The hostname or IP address of the Redis instance."
  value       = google_redis_instance.default.host
}
