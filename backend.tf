// backend configuration

terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket-sairam" # Replace with your GCS bucket for state
    prefix = "terraform/state/provider"
  }
}
