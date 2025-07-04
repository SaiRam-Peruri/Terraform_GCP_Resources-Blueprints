# artifact_registry.tf

## What is it?
Defines Google Artifact Registry resources. Artifact Registry is a fully managed service for storing and managing container images, language packages, and other build artifacts.

## Why use it?
Artifact Registry provides secure, scalable, and integrated artifact storage for CI/CD pipelines, supporting containerized and serverless deployments.

## How to use
- Set variables such as `project_id`, `location`, `repository_id`, and `format` (e.g., docker, maven).
- This module provisions an Artifact Registry repository for storing and managing build artifacts.

## How it's used in this project
This file provides a modular way to manage artifact storage, supporting automated build, test, and deployment workflows in your GCP environment.
