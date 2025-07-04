# external_ip.tf

## What is it?
Defines Google Compute Engine external (static) IP address resources. These are reserved public IPs that can be assigned to VM instances, load balancers, or other resources.

## Why use it?
Static external IPs provide a consistent, reliable public endpoint for your services. They are essential for DNS mapping, whitelisting, and ensuring your service's IP doesn't change on restart.

## How to use
- Set variables such as `project_id`, `name`, and `region` or `address_type`.
- This module provisions a static external IP that can be referenced by other resources (e.g., VM, load balancer).

## How it's used in this project
This file enables modular, reusable allocation of public IPs, supporting scalable and reliable network architectures in your GCP environment.
