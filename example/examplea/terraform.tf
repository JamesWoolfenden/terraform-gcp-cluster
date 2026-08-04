# holden:ignore:HLD_TF_004: this is an example
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.36.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
  required_version = ">= 1.5.0"
}
