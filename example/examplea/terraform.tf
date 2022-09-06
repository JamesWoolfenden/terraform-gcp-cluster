terraform {
  required_providers {
    google = {
      version = "4.34.0"
      source  = "hashicorp/google"
    }
    google-beta = {
      version = "4.34.0"
      source  = "hashicorp/google-beta"
    }
  }
  required_version = ">=0.14.8"
}
