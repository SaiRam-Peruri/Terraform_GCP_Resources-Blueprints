// GCP Managed Instance Group - modular and production-grade

resource "google_compute_region_instance_group_manager" "mig" {
  count              = var.group_name != null ? 1 : 0
  name               = var.group_name
  base_instance_name = var.base_instance_name
  region             = var.region
  project            = var.project_id

  version {
    instance_template = length(google_compute_instance_template.template) > 0 ? google_compute_instance_template.template[0].self_link : null
  }

  target_size = var.target_size

  # Remove auto_healing_policies for now - requires a valid health check
  # auto_healing_policies {
  #   health_check      = google_compute_health_check.default.self_link
  #   initial_delay_sec = 300
  # }

  update_policy {
    type                         = "PROACTIVE"
    instance_redistribution_type = "PROACTIVE"
    minimal_action               = "REPLACE"
    max_surge_fixed              = 1
    max_unavailable_fixed        = 0
  }
}

output "mig_id" {
  description = "The ID of the created managed instance group."
  value       = length(google_compute_region_instance_group_manager.mig) > 0 ? google_compute_region_instance_group_manager.mig[0].id : null
}

output "mig_instance_group" {
  description = "The instance group of the managed instance group."
  value       = length(google_compute_region_instance_group_manager.mig) > 0 ? google_compute_region_instance_group_manager.mig[0].instance_group : null
}
