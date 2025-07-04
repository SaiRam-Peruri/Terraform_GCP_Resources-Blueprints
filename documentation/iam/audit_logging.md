# audit_logging.tf

## What is it?
Defines Google Cloud audit logging resources and configurations. Audit logging tracks administrative, data, and system events for GCP resources, supporting security and compliance.

## Why use it?
Audit logs are essential for monitoring access, detecting suspicious activity, and meeting regulatory requirements. They provide a detailed record of who did what, when, and where in your cloud environment.

## How to use
- Set variables such as `project_id`, `log_type`, and `service`.
- This module configures audit logging for specific services or resources, ensuring critical actions are always logged.

## How it's used in this project
This file provides a modular way to enable and manage audit logging, supporting best practices for security, compliance, and operational visibility across your GCP workloads.
