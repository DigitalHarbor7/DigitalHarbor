terraform {
  required_providers {
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.0"

    }
    namecheapecosystem = {
      source  = "Namecheap-Ecosystem/namecheap"
      version = "0.1.7"
    }

    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}
