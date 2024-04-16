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


provider "namecheapecosystem" {
  username  = var.username
  api_user  = var.username
  api_token = var.api_key
}
# Create a new Namecheap domain DNS
# resource "namecheap_domain_dns" "mydns" {
#   provider = namecheapecosystem
#   domain   = var.domain

#   nameservers = cloudflare_zone.my_zone.name_servers
# }

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# data "cloudflare_accounts" "cloudflare_account_data" {
#   name = "cloudflare@pype.aleeas.com"
# }

# Cloudflare Pages project with managing build config
# resource "cloudflare_pages_project" "build_config" {
#   account_id        = var.cloudflare_account_id
#   name              = replace(var.domain, ".", "-")
#   production_branch = "main"
#   source {
#     type = "github"
#     config {
#       owner                         = "pypeaday"
#       repo_name                     = "DigitalHarbor"
#       production_branch             = "main"
#       production_deployment_enabled = true
#       preview_branch_includes       = ["develop"]
#     }
#   }
#   build_config {
#     # root_dir = "_site"
#     root_dir = "_site/1man1band"
#   }
#   deployment_configs {
#     preview {}
#     production {}
#   }
# }
# resource "cloudflare_pages_domain" "my_domain" {
#   account_id   = var.cloudflare_account_id
#   project_name = cloudflare_pages_project.build_config.name
#   domain       = var.domain
# }
# resource "cloudflare_pages_domain" "www_my_domain" {
#   account_id   = var.cloudflare_account_id
#   project_name = cloudflare_pages_project.build_config.name
#   domain       = "www.${var.domain}"
# }

# resource "cloudflare_zone" "my_zone" {
#   account_id = var.cloudflare_account_id
#   zone       = var.domain
# }

# resource "cloudflare_record" "my_record_develop" {
#   zone_id         = cloudflare_zone.my_zone.id
#   name            = "develop"
#   value           = "develop.${replace(var.domain, ".", "-")}.pages.dev"
#   type            = "CNAME"
#   proxied         = true
#   ttl             = 1
#   allow_overwrite = true
# }
# resource "cloudflare_record" "my_record_www" {
#   zone_id         = cloudflare_zone.my_zone.id
#   name            = "www"
#   value           = "${replace(var.domain, ".", "-")}.pages.dev"
#   type            = "CNAME"
#   proxied         = true
#   ttl             = 1
#   allow_overwrite = true
# }

# resource "cloudflare_record" "my_record" {
#   zone_id         = cloudflare_zone.my_zone.id
#   name            = var.domain
#   value           = "${replace(var.domain, ".", "-")}.pages.dev"
#   type            = "CNAME"
#   proxied         = true
#   ttl             = 1
#   allow_overwrite = true
# }

