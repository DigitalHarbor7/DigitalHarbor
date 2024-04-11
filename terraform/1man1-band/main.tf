variable "github_token" {}
variable "github_user" {}

provider "github" {
  owner = var.github_user
  token = var.github_token
}

resource "github_repository" "digital-harbor-1man1-band" {
  name        = "digital-harbor-1man1-band"
  description = "Josh's digital harbor"
  archived    = true

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

# Removing this stuff because this was for GH pages - cloudflare pages requires
# custom dns, not A/CNAME records which requries a different terraform provier
provider "namecheap" {
  user_name = var.username
  api_user  = var.username
  api_key   = var.api_key
}
#
# resource "namecheap_domain_records" "_1man1-band" {
#   domain     = var.domain
#   email_type = "NONE"
#
#   # GH Pages servers
#   dynamic "record" {
#     for_each = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
#
#     content {
#       hostname = "@"
#       type     = "A"
#       address  = record.value
#     }
#   }
#
#   record {
#     hostname = "www"
#     type     = "CNAME"
#     address  = "pypeaday.github.io"
#   }
# }

provider "namecheapecosystem" {
  username  = var.username
  api_user  = var.username
  api_token = var.api_key
}
# Create a new Namecheap domain DNS
resource "namecheap_domain_dns" "mydns" {
  provider = namecheapecosystem
  domain   = var.domain

  nameservers = cloudflare_zone.zone_1man1-band.name_servers
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_accounts" "cloudflare_account_data" {
  name = "cloudflare@pype.aleeas.com"
}
# Cloudflare Pages project with managing build config
resource "cloudflare_pages_project" "build_config" {
  account_id        = var.cloudflare_account_id
  name              = replace(var.domain, ".", "-")
  production_branch = "main"
  source {
    type = "github"
    config {
      owner                         = "pypeaday"
      repo_name                     = "DigitalHarbor"
      production_branch             = "main"
      production_deployment_enabled = true
    }
  }
  build_config {
    # root_dir = "_site"
    root_dir = "_site/1man1band"
  }
  deployment_configs {
    # preview {}
    production {}
  }
}
resource "cloudflare_pages_domain" "cf_1man1-band" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.build_config.name
  domain       = var.domain
}

resource "cloudflare_zone" "zone_1man1-band" {
  account_id = var.cloudflare_account_id
  zone       = var.domain
}

resource "cloudflare_record" "cf_1man1-band_record_www" {
  zone_id         = cloudflare_zone.zone_1man1-band.id
  name            = "www"
  value           = var.domain
  type            = "CNAME"
  proxied         = true
  ttl             = 1
  allow_overwrite = true
}

resource "cloudflare_record" "cf_1man1-band_record" {
  zone_id         = cloudflare_zone.zone_1man1-band.id
  name            = var.domain
  value           = "${replace(var.domain, ".", "-")}.pages.dev"
  type            = "CNAME"
  proxied         = true
  ttl             = 1
  allow_overwrite = true
}

