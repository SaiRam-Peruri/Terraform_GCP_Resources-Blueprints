// Main networking module file - orchestrates all networking resources

// The resources are defined in their respective .tf files in this same directory:
// - vpc.tf: VPC networks
// - subnet.tf: Subnetworks
// - firewall.tf: Firewall rules
// - nat_gateway.tf: NAT gateways
// - router.tf: Cloud routers
// - external_ip.tf: External IP addresses
// - private_google_access.tf: Private Google Access
// - variables.tf: All input variables
// - This main.tf serves as the entry point and contains shared configuration

locals {
  # Common configuration
  project_id = var.project_id
  region     = var.region

  # VPC configuration
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks

  # Subnet configuration
  subnet_name   = var.subnet_name != null ? var.subnet_name : "${var.vpc_name}-subnet"
  ip_cidr_range = var.ip_cidr_range

  # Firewall configuration
  firewall_name = var.firewall_name != null ? var.firewall_name : "${var.vpc_name}-allow-web"
  source_ranges = var.source_ranges
  target_tags   = var.target_tags

  # Router and NAT configuration
  router_name = var.router_name != null ? var.router_name : "${var.vpc_name}-router"
  nat_name    = var.nat_name != null ? var.nat_name : "${var.vpc_name}-nat"

  # Network references
  network_id     = var.network_id != null ? var.network_id : (var.vpc_network_id != null ? var.vpc_network_id : google_compute_network.vpc_network.id)
  vpc_network_id = var.vpc_network_id != null ? var.vpc_network_id : (var.network_id != null ? var.network_id : google_compute_network.vpc_network.id)

  # External IP configuration
  ip_name = var.ip_name != null ? var.ip_name : "${var.vpc_name}-external-ip"

  # Private Google Access configuration
  private_google_access = var.private_google_access

  common_labels = {
    environment = "development"
    managed-by  = "terraform"
    module      = "networking"
  }
}

// All outputs from individual resource files are automatically available
// when this module is called from the root main.tf
