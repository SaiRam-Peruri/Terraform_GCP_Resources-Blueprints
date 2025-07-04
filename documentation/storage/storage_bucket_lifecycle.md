# bucket_lifecycle.tf

## What is it?
Defines lifecycle rules for Google Cloud Storage buckets. Lifecycle rules automate actions like deleting, archiving, or changing storage class for objects based on age or conditions.

## Why use it?
Lifecycle management helps control storage costs, enforce data retention policies, and automate data management without manual intervention.

## How to use
- Set variables such as `bucket`, `action`, and `condition`.
- This module applies lifecycle rules to a bucket, automating object management.

## How it's used in this project
This file provides a modular way to enforce data lifecycle policies, supporting cost optimization and compliance for your storage resources.
