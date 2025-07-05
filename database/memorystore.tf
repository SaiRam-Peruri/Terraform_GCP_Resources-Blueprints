// GCP Memorystore (Redis) - modular and production-grade

resource "google_redis_instance" "default" {
  name           = local.memorystore_name
  project        = local.project_id
  region         = local.region
  tier           = local.redis_tier
  memory_size_gb = local.memory_size_gb
}

output "memorystore_instance_host" {
  description = "The hostname or IP address of the Redis instance."
  value       = google_redis_instance.default.host
}
