resource "google_compute_instance" "vpn-server" {
  name                    = var.server_name
  machine_type            = var.instance_type
  can_ip_forward          = true
  metadata_startup_script = file("./startup_script.sh")

  tags = ["vpn-server", "http", "https"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = var.network_name
    access_config {}
  }
}
