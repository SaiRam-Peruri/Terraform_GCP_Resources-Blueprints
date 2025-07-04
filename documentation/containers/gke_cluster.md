# gke_cluster.tf

## What is it?
Defines Google Kubernetes Engine (GKE) standard cluster resources. Standard clusters provide full control over node management, scaling, and configuration.

## Why use it?
Standard GKE clusters are ideal for teams needing advanced customization, control, and integration with existing infrastructure or security policies.

## How to use
- Set variables such as `project_id`, `name`, `location`, `node_config`, and networking options.
- This module provisions a standard GKE cluster with your desired configuration.

## How it's used in this project
This file provides a modular way to deploy and manage Kubernetes clusters, supporting scalable, secure, and production-grade container orchestration in GCP.
