# disk.tf

## What is it?
Defines Google Compute Engine persistent disk resources. Persistent disks are durable storage devices that can be attached to VM instances.

## Why use it?
Persistent disks provide high-performance, reliable block storage for your VMs. They support features like snapshots, resizing, and encryption, making them suitable for a wide range of workloads.

## How to use
- Set variables such as `project_id`, `name`, `zone`, `size`, and `type`.
- This module provisions a persistent disk that can be attached to one or more VM instances.

## How it's used in this project
This file enables modular, reusable disk provisioning for compute workloads, supporting scalable and flexible storage architectures in your GCP environment.
