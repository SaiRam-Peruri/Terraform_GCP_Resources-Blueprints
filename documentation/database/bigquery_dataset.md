# bigquery_dataset.tf

## What is it?
Defines Google BigQuery dataset resources. Datasets are top-level containers for tables, views, and data in BigQuery.

## Why use it?
Datasets organize and secure your data, supporting analytics, reporting, and data science at scale. They enable fine-grained access control and data lifecycle management.

## How to use
- Set variables such as `project_id`, `dataset_id`, `location`, and `description`.
- This module provisions a BigQuery dataset for storing and managing structured data.

## How it's used in this project
This file provides a modular way to manage datasets, supporting scalable, secure, and organized analytics in your GCP environment.
