# private_google_access.tf

## What is it?
Defines resources to enable Private Google Access for subnets. This allows VMs without external IPs to access Google APIs and services privately.

## Why use it?
Private Google Access is critical for secure, compliant environments where VMs must access Google services (like Cloud Storage or BigQuery) without public internet exposure.

## How to use
- Set variables such as `project_id`, `subnet`, and enable/disable flag.
- This module configures the subnet to allow private access to Google APIs.

## How it's used in this project
This file provides a modular way to enable secure, private API access for workloads, supporting best practices for network isolation and compliance.
