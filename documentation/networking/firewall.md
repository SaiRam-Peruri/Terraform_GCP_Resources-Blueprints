# firewall.tf

## What is it?
Defines Google Compute Engine firewall rule resources. Firewall rules control traffic to and from your VPC networks and resources.

## Why use it?
Firewalls are essential for securing your cloud environment, restricting access to only trusted sources, and segmenting workloads. They help enforce least-privilege network access.

## How to use
- Set variables such as `project_id`, `name`, `network`, `direction`, `priority`, `allow`/`deny` rules, and `source_ranges`.
- This module provisions a firewall rule that can be applied to VPCs, subnets, or specific resources.

## How it's used in this project
This file provides modular, reusable firewall rule definitions, supporting secure, compliant, and auditable network configurations across your GCP workloads.
