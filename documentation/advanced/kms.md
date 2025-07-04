# kms.tf

## What is it?
Defines Google Cloud Key Management Service (KMS) resources, including key rings and crypto keys. KMS is used for managing cryptographic keys for your cloud services.

## Why use it?
KMS enables you to create, rotate, and manage encryption keys centrally, ensuring data security and compliance. It is essential for encrypting sensitive data at rest and controlling access to encryption keys.

## How to use
- Set `project_id`, `location`, `key_ring_name`, and `crypto_key_name` as variables.
- This module creates a key ring and a crypto key, which can be used by other GCP services (e.g., Cloud Storage, Compute Engine, BigQuery) for encryption.

## How it's used in this project
This file provides a modular way to provision and manage KMS resources, supporting secure, compliant infrastructure across all modules that require encryption.
