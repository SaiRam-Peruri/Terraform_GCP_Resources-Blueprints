// GCP Logging Project Sink - modular and production-grade

resource "google_logging_project_sink" "default" {
  name        = var.sink_name
  project     = var.project_id
  destination = var.destination
  filter      = var.filter
}

output "log_sink_writer_identity" {
  description = "The service account identity used by the sink to write logs."
  value       = google_logging_project_sink.default.writer_identity
}
