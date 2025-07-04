# alert_policy.tf

## What is it?
Defines Google Cloud Monitoring alert policy resources. Alert policies monitor metrics and trigger notifications when conditions are met.

## Why use it?
Alerting is essential for proactive operations, enabling you to detect and respond to incidents, performance issues, or outages before they impact users.

## How to use
- Set variables such as `project_id`, `alert_policy_display_name`, `conditions`, and `notification_channels`.
- This module provisions an alert policy with customizable conditions and notification options.

## How it's used in this project
This file provides a modular way to define alerting rules, supporting reliable, automated monitoring and incident response in your GCP environment.
