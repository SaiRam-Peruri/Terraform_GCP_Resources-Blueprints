# nat_gateway.tf

## What is it?
Defines Google Cloud NAT (Network Address Translation) gateway resources. Cloud NAT allows private resources to access the internet securely without exposing their private IPs.

## Why use it?
Cloud NAT is essential for enabling outbound internet access for private VMs and containers, supporting patching, updates, and external API calls while maintaining a secure, private network.

## How to use
- Set variables such as `project_id`, `region`, `router`, and NAT configuration options.
- This module provisions a NAT gateway attached to a Cloud Router, supporting scalable and highly available outbound connectivity.

## How it's used in this project
This file provides a modular, production-grade way to enable secure internet access for private resources, supporting best practices for network security and compliance.
