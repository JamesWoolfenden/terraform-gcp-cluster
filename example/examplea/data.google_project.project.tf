data "google_project" "this" {
  project_id = "pike-477416"
}

data "google_compute_zones" "available" {
  region = var.region
}
