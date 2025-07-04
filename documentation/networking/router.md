# router.tf

## What is it?
Defines Google Cloud Router resources. Cloud Router dynamically exchanges routes between your VPC and on-premises networks or other cloud environments using BGP.

## Why use it?
Cloud Router is essential for hybrid and multi-cloud architectures, enabling dynamic, scalable, and highly available network connectivity.

## How to use
- Set variables such as `project_id`, `name`, `network`, and `region`.
- This module provisions a Cloud Router, which can be used with Cloud NAT or VPN gateways.

## How it's used in this project
This file provides a modular, reusable way to manage dynamic routing, supporting advanced networking scenarios and seamless integration with on-premises or partner networks.
