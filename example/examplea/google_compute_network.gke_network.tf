resource "google_compute_network" "gke_network" {
  name                            = var.network
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}
