
data "google_compute_network" "gke_network" {
  name    = var.network
  project = var.network_project
}
