// cloud function resource

// GCP Cloud Function - modular and production-grade

resource "google_cloudfunctions_function" "function" {
  # Only create if source_archive_bucket is provided
  count = local.source_archive_bucket != null && local.source_archive_object != null ? 1 : 0

  name        = local.function_name
  project     = local.project_id
  region      = local.region
  runtime     = local.runtime
  entry_point = local.entry_point

  source_archive_bucket = local.source_archive_bucket
  source_archive_object = local.source_archive_object

  trigger_http          = local.trigger_http
  available_memory_mb   = 256
  environment_variables = local.environment_variables
  vpc_connector         = local.vpc_connector
  ingress_settings      = local.ingress_settings

  dynamic "event_trigger" {
    for_each = local.trigger_http ? [] : [1]
    content {
      event_type = local.event_trigger.event_type
      resource   = local.event_trigger.resource
      failure_policy {
        retry = lookup(local.event_trigger, "failure_policy", false)
      }
    }
  }
}

output "cloud_function_name" {
  description = "The name of the created Cloud Function."
  value       = length(google_cloudfunctions_function.function) > 0 ? google_cloudfunctions_function.function[0].name : null
}

output "cloud_function_url" {
  description = "The HTTPS URL trigger for the function (if HTTP triggered)."
  value       = length(google_cloudfunctions_function.function) > 0 && local.trigger_http ? google_cloudfunctions_function.function[0].https_trigger_url : null
}

output "cloud_function_service_account_email" {
  description = "The service account email used by the function."
  value       = length(google_cloudfunctions_function.function) > 0 ? google_cloudfunctions_function.function[0].service_account_email : null
}
