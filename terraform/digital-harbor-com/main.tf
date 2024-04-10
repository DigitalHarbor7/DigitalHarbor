variable "username" {}
variable "api_key" {}

provider "namecheap" {
  user_name = var.username
  api_user  = var.username
  api_key   = var.api_key
}

resource "namecheap_domain_records" "digital-harbor-com" {
  domain     = "mydigitalharbor.com"
  email_type = "NONE"

  dynamic "record" {
    # GH Pages servers
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
    # TODO: still being hosted on doompony - change when apprpriate
    address = "doompony.github.io"
  }
}

