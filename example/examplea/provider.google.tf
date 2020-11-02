provider "google" {

}

provider "google-beta" {

  project = var.project
  region  = var.region
}

provider "http" {

}
