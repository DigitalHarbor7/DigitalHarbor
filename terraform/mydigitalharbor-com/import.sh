#!/bin/bash
terraform import -var-file ../.tf.vars cloudflare_zone.my_zone mydigitalharbor.com
