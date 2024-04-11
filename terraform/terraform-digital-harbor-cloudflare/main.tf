provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_accounts" "cloudflare_account_data" {
  # TODO: variable this
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
      # owner                         = "DigitalHarbor7"
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
resource "cloudflare_pages_domain" "cf_domain" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.build_config.name
  domain       = var.domain
}

resource "cloudflare_zone" "zone" {
  account_id = var.cloudflare_account_id
  zone       = var.domain
}

resource "cloudflare_record" "cf_domain_record_www" {
  zone_id         = cloudflare_zone.zone.id
  name            = "www"
  value           = var.domain
  type            = "CNAME"
  proxied         = true
  ttl             = 1
  allow_overwrite = true
}

resource "cloudflare_record" "cf_domain_record" {
  zone_id         = cloudflare_zone.zone.id
  name            = var.domain
  value           = "${replace(var.domain, ".", "-")}.pages.dev"
  type            = "CNAME"
  proxied         = true
  ttl             = 1
  allow_overwrite = true
}

