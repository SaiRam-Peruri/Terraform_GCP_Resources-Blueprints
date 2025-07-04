terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.39.0"
    }
  }
}

provider "google" {
  project = "gcp-first-project-462902"
  region  = "us-east4"
}