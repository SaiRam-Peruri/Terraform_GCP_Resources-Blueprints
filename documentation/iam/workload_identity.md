# workload_identity.tf

## What is it?
Defines Google Cloud Workload Identity resources. Workload Identity allows Kubernetes service accounts to impersonate GCP service accounts securely.

## Why use it?
Workload Identity is the recommended way to grant GKE workloads access to GCP APIs, eliminating the need for long-lived service account keys and improving security.

## How to use
- Set variables such as `project_id`, `pool_id`, `provider_id`, and `service_account`.
- This module provisions a workload identity pool and provider, enabling secure identity federation for Kubernetes and other workloads.

## How it's used in this project
This file provides a modular way to enable Workload Identity, supporting secure, scalable, and cloud-native access management for containerized applications.
