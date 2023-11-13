variable "project_id" {
  type        = string
  description = "Your project id"
  default = "value"
}

variable "region" {
  type        = string
  description = "Region where to deploy the instance"
  default = "value"
}

variable "zone" {
  type        = string
  description = "Zone where to deploy the instance"
  default = "value"
}

variable "credentials_path" {
  type        = string
  description = "Path to service account json file"
  default = "../..credentials/my-service-account.json"
}

variable "instance_type" {
  type        = string
  description = "The intance size"
  default = "e2-micro"
}

variable "server_name" {
  type = string
  description = "The server name"
  default = "my-vpn-server"
}

variable "server_port" {
  type        = string
  description = "Server port through which VPN clients will be connected"
  default = "1194"
}