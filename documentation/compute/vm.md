# vm.tf

## What is it?
Defines Google Compute Engine VM instance resources. VM instances are the core compute resource in GCP, running your workloads on virtualized hardware.

## Why use it?
VMs provide flexible, scalable compute capacity for any application. You can choose machine types, attach disks, configure networks, and set metadata for automation.

## How to use
- Set variables such as `project_id`, `name`, `zone`, `machine_type`, `boot_disk`, `network_interface`, and `metadata`.
- This module provisions a VM instance with your desired configuration.

## How it's used in this project
This file enables modular, reusable VM provisioning, supporting a wide range of compute workloads and integration with other GCP services.
