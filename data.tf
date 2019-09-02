
data "google_compute_network" "gke_network" {
  name    = var.network
  project = var.network_project
}

data "google_compute_subnetwork" "gke_subnetwork" {
  name    = var.subnetwork
  region  = var.region
  project = var.network_project
}
