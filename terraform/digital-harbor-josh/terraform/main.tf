variable "username" {}
variable "api_key" {}

provider "namecheap" {
  user_name = var.username
  api_user  = var.username
  api_key   = var.api_key
}

resource "namecheap_domain_records" "_1man1band-com" {
  domain     = "1man1band.com"
  email_type = "NONE"

  dynamic "record" {
    # GH Pages servers
    for_each = ["185.189.108.153", "185.189.109.153", "185.189.110.153", "185.189.111.153"]

    content {
      hostname = "@"
      type     = "A"
      address  = record.value
    }
  }

  record {
    hostname = "www"
    type     = "CNAME"
    address  = "pypeaday.github.io"
  }
}

resource "namecheap_domain_records" "_1man1-band" {
  domain     = "1man1.band"
  email_type = "NONE"

  record {
    hostname = "www"
    type     = "CNAME"
    address  = "1man1band.com"
  }
}

