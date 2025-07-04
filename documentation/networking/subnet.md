# subnet.tf

## What is it?
Defines Google Compute Engine subnet resources. Subnets are IP address ranges within a VPC network, used to segment and organize resources.

## Why use it?
Subnets enable you to control IP allocation, isolate workloads, and apply security policies at a granular level. They are foundational for scalable, secure network design.

## How to use
- Set variables such as `project_id`, `name`, `network`, `ip_cidr_range`, and `region`.
- This module provisions a subnet that can be used by VMs, GKE clusters, and other resources.

## How it's used in this project
This file provides a modular, reusable way to define subnets, supporting best practices for network segmentation and resource organization.
