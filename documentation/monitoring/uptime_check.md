# uptime_check.tf

## What is it?
Defines Google Cloud Monitoring uptime check resources. Uptime checks monitor the availability of your services from multiple locations worldwide.

## Why use it?
Uptime checks provide early detection of outages, performance issues, or misconfigurations, supporting high availability and reliability.

## How to use
- Set variables such as `project_id`, `uptime_check_name`, `checker_type`, `host`, and `path`.
- This module provisions an uptime check for HTTP, TCP, or other protocols.

## How it's used in this project
This file provides a modular way to monitor service health, supporting proactive operations and rapid incident response in your GCP environment.
