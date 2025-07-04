# access_context.tf

## What is it?
Defines GCP Access Context Manager resources, specifically access policies. These are used to set up security perimeters and context-aware access controls for GCP organizations.

## Why use it?
Access Context Manager allows organizations to enforce security boundaries, restrict access to resources based on context (such as user identity, device security status, or IP address), and implement BeyondCorp-style security.

## How to use
- Set your `organization_id` and a descriptive `access_policy_title` as variables.
- This module creates an access policy at the organization level, which can be referenced by access levels and service perimeters in larger security architectures.

## How it's used in this project
This file provides a modular, reusable way to define access policies, making it easy to integrate context-aware security into any GCP environment managed by this repository.
