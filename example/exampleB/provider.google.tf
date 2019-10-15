provider "google" {
  version = "2.5.1"
  project = data.google_project.project.name
  region  = var.region
}

provider "google-beta" {
  version = "2.14"
  project = data.google_project.project.name
  region  = var.region
}

provider "http" {
  version = "1.1"
}
