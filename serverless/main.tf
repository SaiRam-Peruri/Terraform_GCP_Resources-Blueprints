// Main serverless module file - orchestrates all serverless resources

// The resources are defined in their respective .tf files in this same directory:
// - cloud_function.tf: Cloud Functions
// - cloud_run.tf: Cloud Run services
// - cloud_tasks.tf: Cloud Tasks queues
// - eventarc.tf: Eventarc triggers
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

locals {
  # Common configuration
  project_id = var.project_id
  region     = var.region
  location   = var.location != null ? var.location : var.region

  # Base name configuration
  base_name = var.name

  # Cloud Function configuration
  function_name         = var.function_name != null ? var.function_name : "${var.name}-function"
  entry_point           = var.entry_point
  runtime               = var.runtime
  source_archive_bucket = var.source_archive_bucket
  source_archive_object = var.source_archive_object
  environment_variables = var.environment_variables
  vpc_connector         = var.vpc_connector
  ingress_settings      = var.ingress_settings
  trigger_http          = var.trigger_http
  event_trigger         = var.event_trigger

  # Cloud Run configuration
  service_name = var.service_name != null ? var.service_name : "${var.name}-service"
  image        = var.image

  # Cloud Tasks configuration - use timestamp to avoid retention conflicts
  timestamp  = formatdate("YYYYMMDD-hhmm", timestamp())
  queue_name = var.queue_name != null ? var.queue_name : "terraform-tasks-queue-${local.timestamp}"

  # Eventarc configuration
  trigger_name            = var.trigger_name != null ? var.trigger_name : "${var.name}-trigger"
  destination_run_service = var.destination_run_service
  event_filters           = var.event_filters

  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "serverless"
  }
}

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf
