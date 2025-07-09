# cloudbuild.tf

## What is it?
Defines Google Cloud Build resources. Cloud Build is a fully managed CI/CD platform for building, testing, and deploying applications on GCP.

## Why use it?
Cloud Build automates your build and deployment pipelines, supporting Docker, Maven, Gradle, Bazel, and custom workflows. It integrates with Artifact Registry, Cloud Run, GKE, and more.

## How to use
- Set variables such as `project_id`, `trigger_name`, `repo`, and build steps.
- This module provisions Cloud Build triggers and configurations for automated CI/CD.

## How it's used in this project
This file provides a modular way to enable automated build and deployment, supporting DevOps best practices and rapid delivery in your GCP environment.
