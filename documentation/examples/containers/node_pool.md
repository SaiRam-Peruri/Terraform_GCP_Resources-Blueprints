# node_pool.tf

## What is it?
Defines Google Kubernetes Engine (GKE) node pool resources. Node pools are groups of nodes (VMs) with a shared configuration, managed as part of a GKE cluster.

## Why use it?
Node pools enable you to run different workloads on different machine types, optimize costs, and perform rolling upgrades or scaling independently.

## How to use
- Set variables such as `project_id`, `cluster_name`, `node_count`, `machine_type`, and other node settings.
- This module provisions a node pool for your GKE cluster.

## How it's used in this project
This file provides a modular way to manage node pools, supporting flexible, scalable, and cost-effective Kubernetes deployments in GCP.
