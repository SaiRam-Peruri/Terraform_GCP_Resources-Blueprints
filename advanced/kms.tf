// GCP KMS Key Ring and Crypto Key - modular and production-grade

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "location" {
  description = "The location for the key ring."
  type        = string
  default     = "global"
}

variable "key_ring_name" {
  description = "The name of the key ring."
  type        = string
}

variable "crypto_key_name" {
  description = "The name of the crypto key."
  type        = string
}

resource "google_kms_key_ring" "default" {
  name     = var.key_ring_name
  project  = var.project_id
  location = var.location
}

resource "google_kms_crypto_key" "default" {
  name            = var.crypto_key_name
  key_ring        = google_kms_key_ring.default.id
  rotation_period = "100000s"
}

output "kms_crypto_key_id" {
  description = "The ID of the created KMS crypto key."
  value       = google_kms_crypto_key.default.id
}
