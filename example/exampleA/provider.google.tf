provider "google" {
  version = "~>3.5"
}

provider "google-beta" {
  version = "2.14"
  project = var.project
  region  = var.region
}

provider "http" {
  version = "1.1"
}
