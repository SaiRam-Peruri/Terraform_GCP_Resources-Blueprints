# Infrastructure Documentation

This directory contains comprehensive documentation for all modules and resources in the GCP infrastructure blueprint. Each module has detailed documentation covering configuration, usage examples, best practices, and troubleshooting.

## Documentation Structure

### Core Infrastructure Modules

#### [Compute](compute/)
- **[VM Instances](compute/vm.md)** - Google Compute Engine instances with startup scripts and monitoring
- **[Persistent Disks](compute/disk.md)** - Additional storage with backup and performance optimization
- **[Instance Templates](compute/instance_template.md)** - Templates for managed instance groups
- **[Managed Instance Groups](compute/managed_instance_group.md)** - Auto-scaling compute groups
- **[Startup Scripts](compute/startup_script.md)** - Automated instance configuration

#### [Storage](storage/)
- **[Cloud Storage Buckets](storage/storage_bucket.md)** - Object storage with lifecycle policies
- **[Bucket IAM](storage/storage_bucket_iam.md)** - Access control and permissions
- **[Lifecycle Management](storage/storage_bucket_lifecycle.md)** - Automated data archival
- **[Versioning](storage/storage_bucket_versioning.md)** - Object version control

#### [Networking](networking/)
- **[VPC Networks](networking/vpc.md)** - Virtual private cloud configuration
- **[Subnets](networking/subnet.md)** - Network segmentation and IP management
- **[Firewall Rules](networking/firewall.md)** - Network security and traffic control
- **[NAT Gateway](networking/nat_gateway.md)** - Outbound internet access for private instances
- **[External IPs](networking/external_ip.md)** - Public IP address management
- **[Cloud Router](networking/router.md)** - Dynamic routing configuration
- **[Private Google Access](networking/private_google_access.md)** - Secure API access

#### [Database](database/)
- **[Cloud SQL](database/cloudsql.md)** - Managed PostgreSQL database with HA and backups
- **[BigQuery](database/bigquery_dataset.md)** - Data warehouse and analytics
- **[Firestore](database/firestore.md)** - NoSQL document database
- **[Datastore](database/datastore.md)** - NoSQL entity database
- **[Memorystore](database/memorystore.md)** - Managed Redis for caching

### Application Platform Modules

#### [Containers](containers/)
- **[GKE Standard Cluster](containers/gke_cluster.md)** - Production Kubernetes cluster
- **[GKE Autopilot](containers/gke_autopilot.md)** - Fully managed Kubernetes
- **[Node Pools](containers/node_pool.md)** - Worker node configuration
- **[GKE Add-ons](containers/gke_addons.md)** - Cluster extensions and features

#### [Serverless](serverless/)
- **[Cloud Functions](serverless/cloud_function.md)** - Event-driven serverless compute
- **[Cloud Run](serverless/cloud_run.md)** - Containerized serverless applications
- **[Cloud Tasks](serverless/cloud_tasks.md)** - Asynchronous task queues
- **[Eventarc](serverless/eventarc.md)** - Event-driven application integration

### Operations and DevOps

#### [Monitoring](monitoring/)
- **[Alert Policies](monitoring/alert_policy.md)** - Automated monitoring and alerting
- **[Uptime Checks](monitoring/uptime_check.md)** - Service availability monitoring
- **[Log Sinks](monitoring/log_sink.md)** - Centralized log aggregation
- **[Notification Channels](monitoring/notification_channel.md)** - Alert delivery configuration

#### [DevOps](devops/)
- **[Cloud Build](devops/cloudbuild.md)** - CI/CD pipelines and automation
- **[Artifact Registry](devops/artifact_registry.md)** - Container and package registry
- **[Source Repositories](devops/source_repo.md)** - Git repository hosting
- **[GitHub Triggers](devops/github_trigger.md)** - GitHub integration for builds

### Security and Identity

#### [IAM](iam/)
- **[Service Accounts](iam/service_account.md)** - Service identity and authentication
- **[IAM Bindings](iam/iam_binding.md)** - Role assignments and permissions
- **[Custom Roles](iam/custom_roles.md)** - Granular permission definitions
- **[Workload Identity](iam/workload_identity.md)** - Secure GKE service account mapping
- **[Audit Logging](iam/audit_logging.md)** - Security and compliance logging

#### [Advanced Security](advanced/)
- **[Cloud KMS](advanced/kms.md)** - Key management and encryption
- **[Secret Manager](advanced/secrets_manager.md)** - Secure secret storage
- **[VPC Peering](advanced/vpc_peering.md)** - Network interconnection
- **[Shared VPC](advanced/shared_vpc.md)** - Cross-project networking
- **[Access Context Manager](advanced/access_context.md)** - Conditional access policies

### Integration and Messaging

#### [Scheduler & Messaging](scheduler_messaging/)
- **[Pub/Sub Topics](scheduler_messaging/pubsub_topic.md)** - Message queues and event streaming
- **[Pub/Sub Subscriptions](scheduler_messaging/pubsub_subscription.md)** - Message consumption
- **[Cloud Scheduler](scheduler_messaging/cloud_scheduler.md)** - Cron job scheduling
- **[Email Notifications](scheduler_messaging/email_notification.md)** - Automated email alerts

### Project Foundation

#### [Provider](provider/)
- **[GCP Provider](provider/provider.md)** - Terraform provider configuration
- **[Required APIs](provider/required_apis.md)** - GCP service enablement
- **[Backend](provider/backend.md)** - Terraform state management

#### [Outputs](outputs/)
- **[Resource Outputs](outputs/outputs.md)** - Infrastructure resource references and connection strings

## Quick Reference

### Deployed Infrastructure Summary
This infrastructure blueprint deploys 40+ GCP resources including:

- **Compute:** VM instances, managed instance groups, persistent disks
- **Storage:** Cloud Storage buckets with lifecycle policies and IAM
- **Networking:** Custom VPC with private/public subnets, firewall rules, NAT gateway
- **Databases:** Cloud SQL PostgreSQL, BigQuery datasets, Firestore, Redis
- **Containers:** GKE standard cluster with node pools and add-ons
- **Serverless:** Cloud Functions, Cloud Run services, Cloud Tasks
- **Monitoring:** Alert policies, uptime checks, log sinks, notification channels
- **DevOps:** Cloud Build triggers, Artifact Registry, Source Repositories
- **Security:** Service accounts, IAM bindings, KMS keys, Secret Manager
- **Messaging:** Pub/Sub topics/subscriptions, Cloud Scheduler jobs

### Common Operations

#### Access Infrastructure
```bash
# SSH to VM instance
gcloud compute ssh demo-instance --zone=us-central1-a

# Connect to GKE cluster
gcloud container clusters get-credentials demo-gke-cluster --zone=us-central1-a

# Access Cloud SQL database
gcloud sql connect demo-postgres --user=demo_user

# View Cloud Storage buckets
gsutil ls
```

#### Monitor Resources
```bash
# View all resources
terraform state list

# Check resource status
gcloud compute instances list
gcloud container clusters list
gcloud sql instances list
gcloud functions list
```

#### View Logs and Metrics
```bash
# Application logs
gcloud functions logs read demo-function --limit=50

# System logs
gcloud logging read "resource.type=gce_instance" --limit=50

# Monitoring metrics
gcloud monitoring metrics list
```

## Best Practices

### Security
- All resources use private IPs where possible
- IAM follows principle of least privilege
- Workload Identity enabled for secure service account access
- Firewall rules restrict access to necessary ports only

### High Availability
- Multi-zone deployments where applicable
- Automated backups for databases
- Health checks and uptime monitoring
- Auto-scaling configured for variable workloads

### Cost Optimization
- Right-sized instance types for workload requirements
- Lifecycle policies for automated data archival
- Preemptible instances for fault-tolerant workloads
- Resource monitoring for usage optimization

### Operations
- Comprehensive monitoring and alerting
- Automated deployment via Terraform
- Centralized logging and audit trails
- Infrastructure as Code best practices

## Getting Help

- **Module-specific issues:** Check the relevant module documentation
- **General troubleshooting:** See [TROUBLESHOOTING_AND_TIPS.md](../TROUBLESHOOTING_AND_TIPS.md)
- **Deployment issues:** See [INSTRUCTIONS.md](../INSTRUCTIONS.md)
- **Project overview:** See [README.md](../README.md)

Each module documentation includes:
- **Overview:** What the module does and why it's useful
- **Configuration:** Detailed parameter explanations
- **Usage Examples:** Common operations and commands
- **Monitoring:** Key metrics and alerting recommendations
- **Security:** Best practices and access control
- **Troubleshooting:** Common issues and solutions
- **Cost Optimization:** Tips for managing costs
