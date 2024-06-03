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

/* variable "credentials_path" {
  type        = string
  description = "Path to service account json file"
}
 */
variable "instance_type" {
  type        = string
  description = "The VM intance size"
}

variable "server_name" {
  type        = string
  description = "The server name (console and S.O. hostname)"
}

variable "server_port" {
  type        = string
  description = "Server port through which VPN clients will be connected, suggestions 1194"
}