// Main storage module file - orchestrates all storage resources

// The resources are defined in their respective .tf files in this same directory:
// - bucket.tf: Storage buckets with lifecycle and versioning
// - bucket_iam.tf: Bucket IAM bindings
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

locals {
  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "storage"
  }
}

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf
