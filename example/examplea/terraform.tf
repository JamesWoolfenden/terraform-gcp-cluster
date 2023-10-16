terraform {
  required_providers {
    google = {
      version = "5.0.0"
      source  = "hashicorp/google"
    }
    google-beta = {
      version = "4.34.0"
      source  = "hashicorp/google-beta"
    }
  }
  required_version = ">= 1.3.5"
}
