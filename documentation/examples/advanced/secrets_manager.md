# secrets_manager.tf

## What is it?
Defines Google Secret Manager resources, including secrets and secret versions. Secret Manager is a secure and convenient way to store API keys, passwords, certificates, and other sensitive data.

## Why use it?
Secret Manager centralizes secret storage, provides fine-grained access control, and enables audit logging. It is a best practice for managing sensitive configuration outside of code and environment variables.

## How to use
- Set `project_id`, `secret_id`, and `secret_data` as variables.
- This module creates a secret and an initial version. You can reference the secret in other modules (e.g., Cloud Functions, Compute Engine) to inject secrets securely.

## How it's used in this project
This file provides a modular, reusable way to manage secrets, ensuring that sensitive data is never hardcoded and is always protected according to GCP best practices.
