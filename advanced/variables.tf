// Variables for advanced modules

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "network_name" {
  description = "The name of the first VPC network."
  type        = string
}

variable "peer_project_id" {
  description = "The project ID of the peer VPC."
  type        = string
}

variable "peer_network_name" {
  description = "The name of the peer VPC network."
  type        = string
}
