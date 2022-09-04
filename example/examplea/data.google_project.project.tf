data "google_project" "project" {
  project_id = "pike-361314"
}

data "google_compute_zones" "available" {
  region  = var.region
  project = var.project
}
