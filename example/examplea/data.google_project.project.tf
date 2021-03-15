data "google_project" "project" {
}

data "google_compute_zones" "available" {
  region = var.region
}
