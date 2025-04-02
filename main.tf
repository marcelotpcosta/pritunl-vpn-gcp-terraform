# Enable IAP API
resource "google_project_service" "iap" {
  service = "iap.googleapis.com"
}

# Instance
resource "google_compute_instance" "vpn-server" {
  name                    = var.server_name
  machine_type            = var.instance_type
  can_ip_forward          = true
  metadata_startup_script = file("pritunl_install.sh")

  tags = ["vpn-server", "http", "https"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" // https://cloud.google.com/compute/docs/images/os-details
      type = "pd-standard"
    }
  }

  network_interface {
    network = google_compute_network.network.name
    access_config {}
  }
}

# Network
resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

# Subnetwork
resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = "10.128.0.0/24"
  region        = var.region
  network       = google_compute_network.network.id
}

# Firewall
resource "google_compute_firewall" "vpn_rule" {
  name        = "vpn-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow vpn admin and user ports, and server port you set in tfvars"

  allow {
    protocol = "udp"
    ports    = [var.server_port]
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["vpn-server"]
  }

# Firewall
resource "google_compute_firewall" "iap_rule" {
  name        = "iap-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow Identity-Aware Proxy"

   allow {
    protocol = "tcp"
   }
    target_tags   = ["vpn-server"]
    source_ranges = ["35.235.240.0/20"] // IAP CIDR range > https://cloud.google.com/iap/docs/using-tcp-forwarding
  }
  