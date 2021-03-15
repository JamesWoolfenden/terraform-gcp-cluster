data "google_compute_subnetwork" "gke_subnetwork" {
  name   = var.subnetwork
  region = var.region
}
