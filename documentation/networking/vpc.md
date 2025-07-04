# vpc.tf

## What is it?
Defines Google Compute Engine VPC (Virtual Private Cloud) network resources. VPCs are the fundamental building block for networking in GCP, providing isolated, configurable network environments.

## Why use it?
VPCs enable you to securely connect and segment resources, control traffic flow, and integrate with on-premises or other cloud networks. They are essential for any GCP deployment.

## How to use
- Set variables such as `project_id`, `name`, `auto_create_subnetworks`, and routing options.
- This module provisions a VPC network that can be used by all other networking and compute resources.

## How it's used in this project
This file provides a modular, production-grade way to define VPCs, supporting scalable, secure, and flexible network architectures for all workloads in your GCP environment.
