# holden:ignore:HLD_GCP_303: to drive the example only
resource "google_compute_network" "gke_network" {
  name                            = var.network
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_router" "gke_network" {
  name    = "${var.network}-router"
  network = google_compute_network.gke_network.self_link
  region  = var.region
}

resource "google_compute_router_nat" "gke_network" {
  name                               = "${var.network}-nat"
  router                             = google_compute_router.gke_network.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  enable_dynamic_port_allocation = true
}
