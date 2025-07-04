# instance_template.tf

## What is it?
Defines Google Compute Engine instance templates. Instance templates are resource definitions used to create VM instances with a consistent configuration.

## Why use it?
Instance templates simplify the management of VM fleets by allowing you to define machine type, disk, network, and metadata settings once and reuse them for managed instance groups or ad-hoc VM creation.

## How to use
- Set variables such as `project_id`, `name`, `machine_type`, `disk`, `network`, and `metadata`.
- This module creates a reusable template for launching VMs with standardized settings.

## How it's used in this project
This file provides a modular way to define and update VM configurations, supporting scalable, automated compute deployments across your GCP workloads.
