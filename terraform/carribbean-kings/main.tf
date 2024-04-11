
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
    root_dir = "_site/carribbean-kings"
  }
  deployment_configs {
    # preview {}
    production {}
  }
}
