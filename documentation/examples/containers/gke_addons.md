# gke_addons.tf

## What is it?
Defines Google Kubernetes Engine (GKE) cluster addons. Addons are optional features and integrations (like monitoring, logging, Istio, etc.) that enhance GKE clusters.

## Why use it?
Addons provide out-of-the-box integrations for observability, security, and networking, reducing operational overhead and enabling advanced use cases.

## How to use
- Set variables such as `project_id`, `cluster_name`, and addon configuration options.
- This module enables or configures addons for your GKE cluster.

## How it's used in this project
This file provides a modular way to manage GKE addons, supporting scalable, secure, and observable Kubernetes environments in GCP.
