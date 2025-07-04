# vpc_peering.tf

## What is it?
Defines Google Compute Network Peering resources for connecting two VPC networks, either within the same project or across different projects.

## Why use it?
VPC peering allows private connectivity between VPC networks, enabling secure communication between services without traversing the public internet. It's essential for microservices, multi-project, or hybrid cloud architectures.

## How to use
- Set `project_id`, `network_name`, `peer_project_id`, and `peer_network_name` as variables.
- This module creates bidirectional peering between two VPCs, ensuring full connectivity.

## How it's used in this project
This file provides a modular, reusable way to establish VPC peering, supporting scalable and secure network topologies across your GCP environment.
