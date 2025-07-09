# github_trigger.tf

## What is it?
Defines Cloud Build GitHub trigger resources. These triggers automatically start builds in response to GitHub events (push, pull request, etc.).

## Why use it?
GitHub triggers enable continuous integration and deployment by connecting your source code repository directly to your build pipeline, ensuring code is tested and deployed automatically.

## How to use
- Set variables such as `project_id`, `trigger_name`, `repo_name`, and event filters.
- This module provisions a Cloud Build trigger that listens to GitHub events and starts builds accordingly.

## How it's used in this project
This file provides a modular way to integrate GitHub with Cloud Build, supporting automated, event-driven CI/CD workflows in your GCP environment.
