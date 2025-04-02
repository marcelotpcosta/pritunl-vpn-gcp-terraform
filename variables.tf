variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "vpn-vpc"
}

variable "subnetwork_name" {
  description = "VPC subnetwork name"
  type        = string
  default     = "vpn-subnetwork"
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "f1-micro"
}

variable "server_name" {
  description = "The server name"
  type        = string
  default     = "vpn-server"
}

variable "project_id" {
  type        = string
  description = "Your GCP project id."
}

variable "region" {
  type        = string
  description = "Region where to deploy your VPN instance."
}

variable "zone" {
  type        = string
  description = "Zone where to deploy your VPN instance."
}

variable "server_port" {
  type        = string
  description = "Server port through which VPN clients will be connected"
  default     = "1194"
}

variable "credentials_path" {
  type        = string
  description = "Path to service account json file"
}