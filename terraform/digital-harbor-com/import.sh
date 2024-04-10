#!/bin/bash
terraform import -var-file ../.tf.vars namecheap_domain_records.digital-harbor-com mydigitalharbor.com
