provider "google" {
  project = data.google_project.project.name
  region  = var.region
}
provider "google-beta" {
  project = data.google_project.project.name
  region  = var.region
}
provider "http" {
}
