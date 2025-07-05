// Variables for networking modules - consolidated from all networking resources

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

// VPC variables
variable "vpc_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether to create default subnets. Should be false for custom subnets."
  type        = bool
  default     = false
}

// Subnet variables
variable "subnet_name" {
  description = "The name of the subnetwork."
  type        = string
  default     = null
}

variable "ip_cidr_range" {
  description = "The primary IP CIDR range for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

// Firewall variables
variable "firewall_name" {
  description = "The name of the firewall rule."
  type        = string
  default     = null
}

variable "source_ranges" {
  description = "List of source CIDR ranges allowed."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "target_tags" {
  description = "List of target tags for the firewall rule."
  type        = list(string)
  default     = ["web-server"]
}

// NAT Gateway variables
variable "nat_name" {
  description = "The name of the NAT gateway."
  type        = string
  default     = null
}

variable "router_name" {
  description = "The name of the router."
  type        = string
  default     = null
}

// External IP variables
variable "ip_name" {
  description = "The name of the external IP address."
  type        = string
  default     = null
}

// Private Google Access variables
variable "private_google_access" {
  description = "Enable Private Google Access for the subnet."
  type        = bool
  default     = true
}

// Network reference variables
variable "network_id" {
  description = "The VPC network ID to associate with resources."
  type        = string
  default     = null
}

variable "vpc_network_id" {
  description = "The ID of the VPC network (alias for network_id)."
  type        = string
  default     = null
}
