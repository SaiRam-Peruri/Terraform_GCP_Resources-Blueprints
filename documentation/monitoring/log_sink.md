# log_sink.tf

## What is it?
Defines Google Cloud Logging project sink resources. Log sinks export logs from Cloud Logging to destinations like Cloud Storage, BigQuery, or Pub/Sub.

## Why use it?
Log sinks enable long-term storage, analysis, and integration of logs with other systems, supporting compliance, security, and operational analytics.

## How to use
- Set variables such as `project_id`, `sink_name`, `destination`, and `filter`.
- This module provisions a log sink that exports logs to your chosen destination.

## How it's used in this project
This file provides a modular way to manage log exports, supporting centralized logging, compliance, and advanced analytics in your GCP environment.
