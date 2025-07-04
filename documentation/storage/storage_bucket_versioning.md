# bucket_versioning.tf

## What is it?
Defines versioning configuration for Google Cloud Storage buckets. Versioning keeps multiple versions of an object, protecting against accidental deletion or overwrites.

## Why use it?
Versioning is critical for data protection, recovery, and auditability. It allows you to restore previous versions of objects and track changes over time.

## How to use
- Set variables such as `bucket` and enable/disable flag.
- This module enables or disables versioning on a bucket, supporting robust data management.

## How it's used in this project
This file provides a modular way to enable versioning, supporting best practices for data durability and recovery in your storage architecture.
