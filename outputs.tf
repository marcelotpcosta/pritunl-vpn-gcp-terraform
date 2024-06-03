output "instance_ip" {
  value       = module.vpn_server.instance_ips
  description = "The public IP address of Pritunl instance"
}
