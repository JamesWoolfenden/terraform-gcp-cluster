terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.45.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.45"
    }
    http = {
      source  = "hashicorp/http"
      version = "1.1"
    }
  }
  required_version = ">= 0.13"
}
