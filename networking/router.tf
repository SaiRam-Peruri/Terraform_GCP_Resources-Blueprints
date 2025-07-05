// router resource

// GCP Cloud Router - modular and production-grade

resource "google_compute_router" "router" {
  name    = local.router_name
  region  = local.region
  network = local.network_id
  project = local.project_id
  // Add BGP, interfaces, etc. as needed
}

output "router_id" {
  description = "The ID of the created Cloud Router."
  value       = google_compute_router.router.id
}
