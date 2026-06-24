resource "google_compute_subnetwork" "gke_subnetwork" {
  name                     = var.subnetwork
  region                   = var.region
  network                  = google_compute_network.gke_network.id
  ip_cidr_range            = var.subnetwork_cidr
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = var.services_cidr
  }

  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL"
  }
}
