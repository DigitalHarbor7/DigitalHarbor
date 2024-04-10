terraform {
  required_providers {
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.0"

    }
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}
