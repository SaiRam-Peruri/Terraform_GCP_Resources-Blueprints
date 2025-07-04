# startup_script.tf

## What is it?
Defines a variable or resource for VM startup scripts. Startup scripts are scripts executed automatically when a VM instance boots.

## Why use it?
Startup scripts automate the configuration and initialization of VMs, such as installing software, configuring services, or pulling application code. This ensures consistency and reduces manual intervention.

## How to use
- Set the `startup_script` variable with your shell or cloud-init script content.
- Reference this variable in your instance template or VM resource metadata.

## How it's used in this project
This file provides a modular way to inject startup automation into VM deployments, supporting repeatable and reliable infrastructure provisioning.
