provider "google" {
  version = "~>3.10"
}

provider "google-beta" {
  version = "2.20.2"
  project = var.project
  region  = var.region
}

provider "http" {
  version = "1.1"
}
