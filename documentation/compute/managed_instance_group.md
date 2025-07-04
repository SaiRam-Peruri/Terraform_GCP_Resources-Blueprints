# managed_instance_group.tf

## What is it?
Defines Google Compute Engine managed instance group (MIG) resources. MIGs manage collections of identical VM instances, providing auto-healing, scaling, and rolling updates.

## Why use it?
Managed instance groups enable high availability and scalability for stateless workloads. They automatically replace unhealthy VMs and can scale up/down based on load or schedules.

## How to use
- Set variables such as `project_id`, `name`, `base_instance_name`, `instance_template`, `target_size`, and `zone` or `region`.
- This module provisions a managed group of VMs using a specified instance template.

## How it's used in this project
This file enables modular, production-grade deployment of scalable compute resources, supporting resilient and automated infrastructure for your applications.
