output "instance_ip" {
  value       = module.vpn-server.instance_ips
  description = "The public IP address of pritunl instance"
}
