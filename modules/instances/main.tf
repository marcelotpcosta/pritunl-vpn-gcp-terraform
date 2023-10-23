resource "google_compute_instance" "vpn-server" {
  name                    = "vpn-server"
  machine_type            = "e2-micro"
  can_ip_forward          = true
  metadata_startup_script = file("./startup_script.sh")

  tags = ["vpn-server", "http", "https"]

  boot_disk {
    initialize_params {
      #image = "ubuntu-2004-focal-v20230104"
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = var.network_name
    access_config {}
  }

/*   metadata = {
    ssh-keys = format("%s%s%s", var.ssh_user, ":", file(var.ssh_pub_key_path))
  } */
}
