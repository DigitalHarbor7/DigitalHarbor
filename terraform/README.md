# Digital Harbor Terraform

This should go in its own repo eventually with some nicer modules

Each folder is just a different site's DNS infra right now

.tf.vars has my info

## TODO

I need to still setup minio for state, or just use s3

## Patterns

1. folder names = domains with . replaced with - and that is the pages project name which should match the subdirectory of `_site` for the page. This matters for consistency between terraform and the github action that loops over _site because the subdirectories of terraform and _site are assumed to be project name and domain respecitively
