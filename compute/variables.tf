// Variables for compute modules - consolidated from all compute resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "zone" {
  description = "The GCP zone."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

// VM variables
variable "vm_name" {
  description = "The name of the VM instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM."
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "The image for the VM boot disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network_id" {
  description = "The VPC network ID."
  type        = string
  default     = "default"
}

variable "subnet_id" {
  description = "The subnetwork ID."
  type        = string
  default     = null
}

// Disk variables
variable "disk_name" {
  description = "The name of the persistent disk."
  type        = string
  default     = null
}

variable "size_gb" {
  description = "The size of the disk in GB."
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The type of the disk (pd-standard, pd-ssd, etc.)."
  type        = string
  default     = "pd-standard"
}

// Instance Template variables
variable "template_name" {
  description = "The name of the instance template."
  type        = string
  default     = null
}

// Managed Instance Group variables
variable "group_name" {
  description = "The name of the managed instance group."
  type        = string
  default     = null
}

variable "base_instance_name" {
  description = "The base name for instances."
  type        = string
  default     = null
}

variable "target_size" {
  description = "The number of instances in the group."
  type        = number
  default     = 1
}
