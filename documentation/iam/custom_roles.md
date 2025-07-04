# custom_roles.tf

## What is it?
Defines custom IAM roles in Google Cloud. Custom roles allow you to create granular, organization-specific sets of permissions tailored to your needs.

## Why use it?
Custom roles help enforce least-privilege access, improve security, and meet compliance requirements by granting only the permissions required for a given job function.

## How to use
- Set variables such as `project_id`, `role_id`, `title`, `description`, and `permissions`.
- This module provisions a custom role that can be assigned to users, groups, or service accounts.

## How it's used in this project
This file provides a modular way to define and manage custom roles, supporting secure, flexible, and auditable access control across your GCP environment.
