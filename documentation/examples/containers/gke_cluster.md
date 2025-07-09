# Google Kubernetes Engine (GKE) Standard Cluster

## Overview
Creates a production-ready GKE Standard cluster with security hardening, monitoring, and scalability features for container workloads.

## Deployed Resources
- **GKE Cluster:** `demo-gke-cluster`
  - **Type:** Standard (full node management control)
  - **Location:** us-central1-a (zonal cluster)
  - **Kubernetes Version:** Latest stable
  - **Network:** demo-vpc/demo-private-subnet
  - **Node Count:** 1 node (initial)

- **Node Pool:** `demo-node-pool`
  - **Machine Type:** e2-medium (2 vCPU, 4GB RAM)
  - **Disk Size:** 100GB pd-standard
  - **Autoscaling:** 1-3 nodes
  - **Auto-upgrade:** Enabled

## Cluster Configuration

### Network Security
- **Private Cluster:** Nodes have private IPs only
- **Master IP Range:** 172.16.0.0/28 (for private endpoint access)
- **Pod IP Range:** Secondary range in subnet
- **Service IP Range:** Secondary range in subnet
- **Authorized Networks:** Configured for secure API access

### Security Features
- **Workload Identity:** Enabled for secure service account mapping
- **Network Policy:** Enabled (Calico)
- **Private Nodes:** No external IPs on nodes
- **Shielded Nodes:** Enabled for integrity monitoring
- **Binary Authorization:** Can be enabled for image security

### Add-ons Enabled
- **HTTP Load Balancing:** For ingress controllers
- **Horizontal Pod Autoscaling:** For automatic pod scaling
- **Network Policy:** For pod-to-pod security
- **Cloud Monitoring:** For cluster and workload metrics
- **Cloud Logging:** For centralized log collection

## Usage Examples

### Connect to Cluster
```bash
# Get cluster credentials
gcloud container clusters get-credentials demo-gke-cluster \
    --zone us-central1-a \
    --project YOUR_PROJECT_ID

# Verify connection
kubectl cluster-info
kubectl get nodes
```

### Deploy Sample Application
```yaml
# nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 500m
            memory: 512Mi
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer
```

```bash
# Deploy application
kubectl apply -f nginx-deployment.yaml

# Check deployment status
kubectl get deployments
kubectl get pods
kubectl get services
```

### Scaling Operations
```bash
# Scale deployment
kubectl scale deployment nginx-deployment --replicas=5

# Scale node pool
gcloud container clusters resize demo-gke-cluster \
    --num-nodes=2 \
    --zone=us-central1-a

# Enable autoscaling
gcloud container clusters update demo-gke-cluster \
    --enable-autoscaling \
    --min-nodes=1 \
    --max-nodes=5 \
    --zone=us-central1-a
```

## Node Pool Management

### Current Configuration
- **Name:** demo-node-pool
- **Machine Type:** e2-medium (cost-effective for demos)
- **Disk Type:** pd-standard (100GB)
- **Preemptible:** Disabled (for stability)
- **Auto-upgrade:** Enabled
- **Auto-repair:** Enabled

### Adding Additional Node Pools
```bash
# Create high-memory node pool
gcloud container node-pools create high-memory-pool \
    --cluster=demo-gke-cluster \
    --machine-type=n1-highmem-2 \
    --num-nodes=1 \
    --zone=us-central1-a \
    --enable-autoscaling \
    --min-nodes=0 \
    --max-nodes=3

# Create preemptible node pool for batch workloads
gcloud container node-pools create batch-pool \
    --cluster=demo-gke-cluster \
    --machine-type=n1-standard-4 \
    --preemptible \
    --num-nodes=0 \
    --zone=us-central1-a \
    --enable-autoscaling \
    --min-nodes=0 \
    --max-nodes=10
```

## Workload Identity Setup

### Enable for Application
```bash
# Create Kubernetes service account
kubectl create serviceaccount demo-app-ksa

# Create Google service account
gcloud iam service-accounts create demo-app-gsa

# Bind service accounts
gcloud iam service-accounts add-iam-policy-binding \
    demo-app-gsa@YOUR_PROJECT_ID.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:YOUR_PROJECT_ID.svc.id.goog[default/demo-app-ksa]"

# Annotate Kubernetes service account
kubectl annotate serviceaccount demo-app-ksa \
    iam.gke.io/gcp-service-account=demo-app-gsa@YOUR_PROJECT_ID.iam.gserviceaccount.com
```

## Monitoring and Logging

### Cluster Metrics
- **Node metrics:** CPU, memory, disk usage
- **Pod metrics:** Resource utilization, restart counts
- **Cluster metrics:** API server health, control plane status
- **Network metrics:** Pod-to-pod and ingress traffic

### Accessing Logs
```bash
# View cluster logs
gcloud logging read "resource.type=k8s_cluster" --limit=50

# View pod logs
kubectl logs -f deployment/nginx-deployment

# View node logs
gcloud logging read "resource.type=gce_instance AND resource.labels.instance_name:gke-demo-gke-cluster" --limit=50
```

### Custom Monitoring
```yaml
# prometheus-config.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
    scrape_configs:
    - job_name: 'kubernetes-nodes'
      kubernetes_sd_configs:
      - role: node
```

## Security Best Practices

### Network Policies
```yaml
# deny-all-policy.yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-nginx
spec:
  podSelector:
    matchLabels:
      app: nginx
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: frontend
    ports:
    - protocol: TCP
      port: 80
```

### Pod Security Standards
```yaml
# pod-security-policy.yaml
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: restricted
spec:
  privileged: false
  allowPrivilegeEscalation: false
  requiredDropCapabilities:
    - ALL
  volumes:
    - 'configMap'
    - 'emptyDir'
    - 'projected'
    - 'secret'
    - 'downwardAPI'
    - 'persistentVolumeClaim'
  runAsUser:
    rule: 'MustRunAsNonRoot'
  seLinux:
    rule: 'RunAsAny'
  fsGroup:
    rule: 'RunAsAny'
```

## Backup and Disaster Recovery

### Backup Strategies
```bash
# Backup cluster configuration
kubectl get all --all-namespaces -o yaml > cluster-backup.yaml

# Backup persistent volumes
kubectl get pv -o yaml > pv-backup.yaml

# Use Velero for comprehensive backups
kubectl apply -f https://github.com/vmware-tanzu/velero/releases/download/v1.9.0/00-prereqs.yaml
```

### Multi-Zone High Availability
```bash
# Create regional cluster for HA
gcloud container clusters create demo-regional-cluster \
    --region=us-central1 \
    --num-nodes=1 \
    --enable-autoscaling \
    --min-nodes=1 \
    --max-nodes=3 \
    --network=demo-vpc \
    --subnetwork=demo-private-subnet
```

## Cost Optimization

### Node Pool Optimization
- Use preemptible instances for stateless workloads
- Enable cluster autoscaling to match demand
- Right-size node machine types based on workload requirements
- Use Spot instances (successor to preemptible) when available

### Resource Management
```yaml
# resource-quota.yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
spec:
  hard:
    requests.cpu: "4"
    requests.memory: 8Gi
    limits.cpu: "8"
    limits.memory: 16Gi
    persistentvolumeclaims: "10"
```

### Cost Monitoring
```bash
# Analyze cluster costs
gcloud billing projects describe YOUR_PROJECT_ID
kubectl top nodes
kubectl top pods --all-namespaces
```

## Troubleshooting

### Common Issues
1. **Pods stuck in Pending:** Check resource quotas and node capacity
2. **Network connectivity:** Verify VPC configuration and firewall rules
3. **Image pull errors:** Check container registry permissions
4. **Node not ready:** Check node health and system resources

### Diagnostic Commands
```bash
# Check cluster status
kubectl get componentstatuses
kubectl describe nodes

# Check pod issues
kubectl describe pod POD_NAME
kubectl logs POD_NAME --previous

# Check cluster events
kubectl get events --sort-by=.metadata.creationTimestamp

# Node SSH access (for debugging)
gcloud compute ssh gke-demo-gke-cluster-default-pool-NODE_ID --zone=us-central1-a
```
