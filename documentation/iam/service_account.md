# service_account.tf

## What is it?
Defines Google Cloud IAM service account resources. Service accounts are special Google accounts used by applications and VMs to interact with GCP APIs securely.

## Why use it?
Service accounts enable secure, automated access to GCP services, supporting best practices for identity, access management, and workload isolation.

## How to use
- Set variables such as `project_id`, `account_id`, `display_name`, and `roles`.
- This module provisions a service account that can be used by VMs, Cloud Functions, or other services.

## How it's used in this project
This file provides a modular way to create and manage service accounts, supporting secure automation and integration across your GCP workloads.
