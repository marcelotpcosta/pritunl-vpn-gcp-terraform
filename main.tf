provider "google" {
  # credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "vpc_network" {
  source      = "./modules/network"
  server_port = var.server_port
}

module "vpn_server" {
  source        = "./modules/instances"
  server_name   = var.server_name
  network_name  = module.vpc_network.network_name
  instance_type = var.instance_type

}

module "iap" {
  source = "./modules/iam"
}