terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.81.0"
    }
  }
}

provider "hcp" {
}