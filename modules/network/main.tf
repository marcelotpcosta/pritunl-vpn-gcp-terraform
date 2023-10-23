resource "google_compute_network" "vpc_network" {
  name                    = "vpn-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "general_rule" {
  name        = "general-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow vpn admin and user ports"

/*   allow {
    protocol = "icmp"
  } */

  allow {
    protocol = "udp"
    ports    = [var.server_port]
  }

    allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags   = ["vpn-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "iap-rule" {
  name        = "iap-rule"
  network     = google_compute_network.vpc_network.name
  description = "Allow vpn admin and user ports"

   allow {
    protocol = "tcp"
   }
    target_tags   = ["vpn-server"]
    source_ranges = ["35.235.240.0/20"]
  }