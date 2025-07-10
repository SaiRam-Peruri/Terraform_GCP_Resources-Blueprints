// Main compute module file - orchestrates all compute resources

// The resources are defined in their respective .tf files in this same directory:
// - vm.tf: VM instances
// - disk.tf: Persistent disks  
// - instance_template.tf: Instance templates
// - managed_instance_group.tf: Managed instance groups
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf

locals {
  # Timestamp for conflict-free naming (useful for testing)
  timestamp = formatdate("YYYYMMDD-hhmm", timestamp())

  # VM configuration - add timestamp option for testing scenarios
  vm_name_final = var.vm_name != null ? "${var.vm_name}-${local.timestamp}" : "terraform-vm-${local.timestamp}"

  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "compute"
  }
}

// Outputs are defined in their respective resource files
