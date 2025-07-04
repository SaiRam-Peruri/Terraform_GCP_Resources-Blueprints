# firestore.tf

## What is it?
Defines Google Firestore database resources. Firestore is a serverless, scalable NoSQL document database for mobile, web, and server applications.

## Why use it?
Firestore provides real-time synchronization, offline support, and strong security for modern applications, supporting rapid development and global scale.

## How to use
- Set variables such as `project_id`, `location_id`, and `type` (NATIVE or DATASTORE_MODE).
- This module provisions a Firestore database for your application data.

## How it's used in this project
This file provides a modular way to deploy and manage Firestore, supporting secure, scalable, and real-time data storage in your GCP environment.
