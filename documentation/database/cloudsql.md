# cloudsql.tf

## What is it?
Defines Google Cloud SQL instance resources. Cloud SQL is a fully managed relational database service for MySQL, PostgreSQL, and SQL Server.

## Why use it?
Cloud SQL provides scalable, secure, and highly available managed databases, reducing operational overhead and supporting business-critical applications.

## How to use
- Set variables such as `project_id`, `name`, `database_version`, `region`, `tier`, and `root_password`.
- This module provisions a Cloud SQL instance for your application data.

## How it's used in this project
This file provides a modular way to deploy and manage relational databases, supporting secure, reliable, and scalable data storage in your GCP environment.
