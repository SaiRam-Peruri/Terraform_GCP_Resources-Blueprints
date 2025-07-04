// GCP VM Startup Script - modular and production-grade

variable "startup_script" {
  description = "The startup script to be used by VM instances."
  type        = string
  default     = "#!/bin/bash\necho Hello, World! > /var/tmp/startup-script.log"
}

// Usage: Pass this variable to the metadata.startup-script field in your VM or instance template.
