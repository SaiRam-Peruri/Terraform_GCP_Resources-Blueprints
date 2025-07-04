# monitoring.tf

## What is it?
Defines Google Cloud Monitoring notification channel resources. Notification channels deliver alerts to email, SMS, webhooks, or other endpoints.

## Why use it?
Notification channels ensure that alerts reach the right people or systems, enabling rapid response to incidents and operational issues.

## How to use
- Set variables such as `project_id`, `type`, `display_name`, and `labels` (e.g., email address).
- This module provisions a notification channel for use with alert policies.

## How it's used in this project
This file provides a modular way to manage alerting destinations, supporting reliable, flexible, and automated incident response in your GCP environment.
