# Virtual Private Cloud (VPC)

## Overview
Creates a Google Cloud VPC network with custom subnets, providing secure and isolated networking foundation for all GCP resources in this infrastructure blueprint.

## Deployed Resources
- **VPC Network:** `demo-vpc`
  - **Type:** Custom mode (manual subnet creation)
  - **Routing Mode:** Regional
  - **Auto-create Subnetworks:** Disabled
  - **Delete Default Routes:** Disabled

## Network Architecture

### VPC Configuration
- **Name:** demo-vpc
- **Custom Mode:** Allows precise control over subnet creation
- **Regional Routing:** Routes are regional by default
- **BGP Routing:** Not applicable (no Cloud Router yet)

### Associated Subnets
1. **Private Subnet:** `demo-private-subnet`
   - **CIDR:** 10.0.1.0/24 (256 addresses)
   - **Region:** us-central1
   - **Private Google Access:** Enabled
   - **Flow Logs:** Enabled

2. **Public Subnet:** `demo-public-subnet`
   - **CIDR:** 10.0.2.0/24 (256 addresses)
   - **Region:** us-central1
   - **Private Google Access:** Enabled
   - **Flow Logs:** Enabled

## Network Features

### Private Google Access
- Enables VMs without external IPs to access Google APIs
- Configured on subnet level
- Essential for private instances to use Cloud Storage, Cloud SQL, etc.

### VPC Flow Logs
- Network monitoring and security analysis
- Logs connection data for traffic analysis
- Retention: 30 days (configurable)
- Sampling rate: 0.5 (50% of flows)

### Firewall Integration
- Default deny-all implicit firewall rules
- Custom rules allow specific traffic patterns
- Tag-based and service account-based targeting

## IP Address Planning

### Subnet Allocation
```
VPC CIDR Block: 10.0.0.0/16 (65,536 addresses)
├── Private Subnet: 10.0.1.0/24 (256 addresses)
├── Public Subnet: 10.0.2.0/24 (256 addresses)
└── Reserved for expansion: 10.0.3.0/24 - 10.0.255.0/24
```

### Reserved Addresses per Subnet
- **Network:** .0 (10.0.1.0)
- **Gateway:** .1 (10.0.1.1)
- **DNS:** .2 (10.0.1.2)
- **Broadcast:** .255 (10.0.1.255)
- **Usable:** .3-.254 (252 addresses per subnet)

## Usage Examples

### List VPC Information
```bash
# List all VPCs
gcloud compute networks list

# Describe VPC details
gcloud compute networks describe demo-vpc

# List subnets in VPC
gcloud compute networks subnets list --filter="network:demo-vpc"

# Show routes
gcloud compute routes list --filter="network:demo-vpc"
```

### Expand VPC (Add Subnets)
```bash
# Add new subnet for databases
gcloud compute networks subnets create demo-db-subnet \
    --network=demo-vpc \
    --range=10.0.3.0/24 \
    --region=us-central1 \
    --enable-private-ip-google-access

# Add subnet in different region
gcloud compute networks subnets create demo-west-subnet \
    --network=demo-vpc \
    --range=10.0.10.0/24 \
    --region=us-west1
```

## Security Considerations

### Network Isolation
- Custom VPC provides complete isolation from default network
- No default firewall rules (all traffic denied by default)
- Subnet-level access controls

### Private Connectivity
- Private Google Access enables secure API access
- No external IPs required for most resources
- Cloud NAT provides controlled outbound internet access

### Traffic Control
- All traffic controlled by firewall rules
- Network tags provide flexible targeting
- Service accounts enable identity-based rules

## Monitoring and Logging

### VPC Flow Logs
```bash
# Query flow logs with gcloud
gcloud logging read "resource.type=gce_subnetwork AND 
    resource.labels.subnetwork_name=demo-private-subnet" \
    --limit=50 --format=json

# Analyze traffic patterns
bq query --use_legacy_sql=false '
SELECT 
  connection.src_ip,
  connection.dest_ip,
  COUNT(*) as connection_count
FROM `PROJECT_ID.vpc_flows.compute_googleapis_com_vpc_flows_*`
WHERE DATE(_PARTITIONTIME) = CURRENT_DATE()
GROUP BY 1, 2
ORDER BY connection_count DESC
LIMIT 10'
```

### Network Monitoring
- VPC Flow Logs export to BigQuery for analysis
- Cloud Monitoring metrics for network performance
- Network topology visualization in Cloud Console

## Peering and Connectivity

### VPC Peering (Future)
```bash
# Create peering connection
gcloud compute networks peerings create demo-to-shared \
    --network=demo-vpc \
    --peer-project=shared-services-project \
    --peer-network=shared-vpc
```

### Hybrid Connectivity Options
- **Cloud VPN:** Site-to-site VPN connections
- **Cloud Interconnect:** Dedicated connections
- **Partner Interconnect:** Service provider connections

## Cost Optimization

### Network Pricing
- **VPC:** Free (no charges for VPC itself)
- **Subnets:** Free
- **Internal Traffic:** Free within same zone
- **Cross-zone Traffic:** Charged
- **External IP:** Charged per hour
- **NAT Gateway:** Charged per hour + data processing

### Best Practices
- Use regional resources to minimize cross-zone traffic
- Implement Private Google Access to avoid external IP costs
- Monitor egress traffic costs
- Use Cloud CDN for external traffic optimization

## Disaster Recovery

### Multi-Region Design
```hcl
# Example additional region configuration
resource "google_compute_subnetwork" "disaster_recovery" {
  name          = "demo-dr-subnet"
  ip_cidr_range = "10.0.100.0/24"
  region        = "us-west2"
  network       = google_compute_network.vpc.id
  
  private_ip_google_access = true
  
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata            = "INCLUDE_ALL_METADATA"
  }
}
```

## Performance Optimization

### Network Performance
- Use instances in the same zone for lowest latency
- Consider Premium Network Service Tier for global applications
- Implement load balancing for high availability
- Use appropriate machine types with sufficient network bandwidth

### Bandwidth Limits
- **Per VM limits:** Based on machine type (2-100 Gbps)
- **Per subnet:** No limits
- **Per VPC:** No limits
- **Cross-region:** Limited by Google backbone capacity
