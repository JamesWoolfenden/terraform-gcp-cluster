resource "google_compute_firewall" "allow_internal" {
  name        = "${var.name}-allow-internal"
  network     = google_compute_network.gke_network.name
  description = "Allow internal traffic between nodes, pods, and services within the GKE VPC"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = [var.subnetwork_cidr, var.pods_cidr, var.services_cidr]

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

# holden:ignore:HLD_GCP_009 — deny rule; 0.0.0.0/0 is the source to deny, not allow
# holden:ignore:HLD_GCP_128 — deny rule; holden cannot distinguish deny from allow blocks
# holden:ignore:HLD_GCP_037 — deny rule; protocol=all is denied, not allowed
# holden:ignore:HLD_GCP_278 — deny rule; full port range is denied, not allowed
# holden:ignore:HLD_GCP_208 — deny rule; HTTP port 80 is denied, not allowed
# holden:ignore:HLD_GCP_207 — deny rule; MySQL port is denied, not allowed
# holden:ignore:HLD_GCP_275 — deny rule; RDP is denied, not allowed
# holden:ignore:HLD_GCP_276 — deny rule; SSH is denied, not allowed
resource "google_compute_firewall" "deny_ingress" {
  name        = "${var.name}-deny-ingress"
  network     = google_compute_network.gke_network.name
  description = "Deny all other ingress traffic not explicitly allowed"
  priority    = 65534

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
