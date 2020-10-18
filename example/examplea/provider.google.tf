provider "google" {
  version = "3.43.0"
}

provider "google-beta" {
  version = "2.20.2"
  project = var.project
  region  = var.region
}

provider "http" {
  version = "1.1"
}
