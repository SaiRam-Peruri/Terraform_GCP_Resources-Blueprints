# Advanced Security and Networking Module
# Provides enterprise-grade security features including KMS encryption,
# secret management, VPC peering, and access controls

locals {
  # KMS Configuration
  kms_location    = var.kms_location
  key_ring_name   = "${var.project_name}-keyring"
  crypto_key_name = "${var.project_name}-key"

  # Secret Manager Configuration
  secret_name = "${var.project_name}-secret"
  secret_data = "demo-secret-value"

  # VPC Peering Configuration (optional)
  enable_vpc_peering = var.enable_vpc_peering
  peer_project_id    = var.peer_project_id
  peer_network_name  = var.peer_network_name

  # Access Context Manager (optional)
  enable_access_context = var.enable_access_context
  access_policy_title   = "${var.project_name}-access-policy"

  # Shared VPC Configuration (optional)
  enable_shared_vpc = var.enable_shared_vpc
  host_project_id   = var.host_project_id

  # Common labels
  common_labels = {
    project     = var.project_name
    environment = "production"
    managed_by  = "terraform"
    module      = "advanced"
  }
}

# KMS Key Ring and Crypto Key for encryption
resource "google_kms_key_ring" "key_ring" {
  name     = local.key_ring_name
  location = local.kms_location
  project  = var.project_id
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = local.crypto_key_name
  key_ring = google_kms_key_ring.key_ring.id
  purpose  = "ENCRYPT_DECRYPT"

  rotation_period = "7776000s" # 90 days

  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
  }

  labels = local.common_labels

  lifecycle {
    prevent_destroy = true
  }
}

# Secret Manager Secret
resource "google_secret_manager_secret" "secret" {
  secret_id = local.secret_name
  project   = var.project_id

  labels = local.common_labels

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = local.secret_data

  depends_on = [google_secret_manager_secret.secret]
}

# Outputs for use by other modules
output "kms_key_ring_id" {
  description = "The ID of the KMS key ring"
  value       = google_kms_key_ring.key_ring.id
}
