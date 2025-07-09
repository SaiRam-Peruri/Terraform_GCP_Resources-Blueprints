#backend configuration
#Bucket now exists - enabling remote state storage

terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket-sairam" # Bucket created successfully
    prefix = "terraform/state/provider"
  }
}

