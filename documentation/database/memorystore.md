# memorystore.tf

## What is it?
Defines Google Memorystore (Redis) resources. Memorystore is a fully managed in-memory data store for Redis, supporting caching and real-time analytics.

## Why use it?
Memorystore provides low-latency, high-throughput caching and session management, improving application performance and scalability.

## How to use
- Set variables such as `project_id`, `name`, `region`, `tier`, and `memory_size_gb`.
- This module provisions a Redis instance for your application.

## How it's used in this project
This file provides a modular way to deploy and manage Redis, supporting fast, scalable, and reliable caching in your GCP environment.
