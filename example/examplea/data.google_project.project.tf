data "google_project" "project" {
  project_id = "pike-477416"
}
data "google_compute_zones" "available" {
  region = var.region
}
