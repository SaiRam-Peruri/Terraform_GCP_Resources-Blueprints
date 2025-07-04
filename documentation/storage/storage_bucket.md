# bucket.tf

## What is it?
Defines Google Cloud Storage bucket resources. Buckets are globally unique containers for storing objects (files, data, backups, etc.) in GCP.

## Why use it?
Buckets provide durable, highly available, and scalable object storage for a wide range of use cases, from static website hosting to data lakes and backups.

## How to use
- Set variables such as `project_id`, `name`, `location`, and storage class.
- This module provisions a storage bucket that can be referenced by other resources (e.g., for logs, backups, or application data).

## How it's used in this project
This file enables modular, reusable bucket provisioning, supporting best practices for data storage, security, and lifecycle management in your GCP environment.
