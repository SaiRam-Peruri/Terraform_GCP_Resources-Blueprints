# bucket_iam.tf

## What is it?
Defines IAM policy bindings for Google Cloud Storage buckets. These bindings control who can access or manage the bucket and its contents.

## Why use it?
IAM policies are essential for enforcing least-privilege access, compliance, and auditability. They allow you to grant granular permissions to users, groups, or service accounts.

## How to use
- Set variables such as `bucket`, `role`, and `members`.
- This module applies IAM bindings to a bucket, enabling secure and auditable access control.

## How it's used in this project
This file provides a modular way to manage bucket permissions, supporting secure, compliant, and flexible access management for your storage resources.
