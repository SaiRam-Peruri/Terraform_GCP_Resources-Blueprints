# shared_vpc.tf

## What is it?
Defines resources for setting up a Shared VPC in GCP, including host and service project attachments. Shared VPC allows multiple projects to share a common VPC network.

## Why use it?
Shared VPC enables centralized network management, improved security, and easier compliance by allowing network resources to be managed in a single host project while service projects consume those resources.

## How to use
- Set `host_project_id` and `service_project_id` as variables.
- This module configures the host project and attaches service projects, allowing them to use the shared network resources.

## How it's used in this project
This file provides a modular approach to Shared VPC, making it easy to scale and manage network resources across multiple GCP projects in an enterprise environment.
