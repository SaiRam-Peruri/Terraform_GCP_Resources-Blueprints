// GCP KMS Key Ring and Crypto Key - modular and production-grade

resource "google_kms_key_ring" "default" {
  name     = "${var.project_name}-keyring"
  project  = var.project_id
  location = var.kms_location
}

resource "google_kms_crypto_key" "default" {
  name            = "${var.project_name}-key"
  key_ring        = google_kms_key_ring.default.id
  rotation_period = "100000s"
}

output "kms_crypto_key_id" {
  description = "The ID of the created KMS crypto key."
  value       = google_kms_crypto_key.default.id
}
