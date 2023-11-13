resource "google_compute_instance" "vpn-server" {
  name                    = var.server_name
  machine_type            = var.instance_type
  can_ip_forward          = true
  metadata_startup_script = file("pritunl_install.sh")

  tags = ["vpn-server", "http", "https"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type = "pd-standard"
    }
  }

  network_interface {
    network = var.network_name
    access_config {}
  }
}
