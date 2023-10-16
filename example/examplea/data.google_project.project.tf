data "google_project" "project" {
  project_id = "pike-gcp"
}
data "google_compute_zones" "available" {
  region  = var.region
  project = var.project
}
