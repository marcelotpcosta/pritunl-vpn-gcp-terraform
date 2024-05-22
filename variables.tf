variable "project_id" {
  type        = string
  description = "Your project id"
}

variable "region" {
  type        = string
  description = "Region where to deploy the instance"
}

variable "zone" {
  type        = string
  description = "Zone where to deploy the instance"
}

variable "credentials_path" {
  type        = string
  description = "Path to service account json file"
}

variable "instance_type" {
  type        = string
  description = "The intance size"
}

variable "server_name" {
  type        = string
  description = "The server name"
}

variable "server_port" {
  type        = string
  description = "Server port through which VPN clients will be connected, suggestions is 1194"
}