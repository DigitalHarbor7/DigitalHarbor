variable "github_token" {}
variable "github_user" {}

provider "github" {
  owner = var.github_user
  token = var.github_token
}

resource "github_repository" "my-repo" {
  name        = "digital-harbor-example"
  description = "An example repo provisioned with terraform that has gh pages configured"

  visibility = "public"

  template {
    owner                = "DigitalHarbor7"
    repository           = "DigitalHarbor-template"
    include_all_branches = false
  }

  pages {
    build_type = "workflow"
    cname      = var.domain
  }
}

provider "namecheap" {
  user_name = var.username
  api_user  = var.username
  api_key   = var.api_key
}

resource "namecheap_domain_records" "_1man1-band" {
  domain     = var.domain
  email_type = "NONE"

  # GH Pages servers
  dynamic "record" {
    for_each = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]

    content {
      hostname = "@"
      type     = "A"
      address  = record.value
    }
  }

  record {
    hostname = "www"
    type     = "CNAME"
    address  = "digitalharbor7.github.io"
  }
}
