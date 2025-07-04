# gke_autopilot.tf

## What is it?
Defines Google Kubernetes Engine (GKE) Autopilot cluster resources. Autopilot clusters are fully managed, hands-off Kubernetes clusters where Google manages the infrastructure.

## Why use it?
Autopilot mode reduces operational burden, optimizes resource usage, and enforces best practices for security and reliability, making Kubernetes accessible to teams of all sizes.

## How to use
- Set variables such as `project_id`, `name`, `location`, and cluster configuration options.
- This module provisions a GKE Autopilot cluster with your desired settings.

## How it's used in this project
This file provides a modular way to deploy Autopilot clusters, supporting rapid, secure, and cost-effective Kubernetes adoption in your GCP environment.
