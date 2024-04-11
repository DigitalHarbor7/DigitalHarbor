# Digital Harbor Terraform

I am moving this over to digital-harbor-infrastructure but I need to plan out what to do in spacelift

## Patterns

1. folder names = domains with . replaced with - and that is the pages project name which should match the subdirectory of `_site` for the page. This matters for consistency between terraform and the github action that loops over _site because the subdirectories of terraform and _site are assumed to be project name and domain respecitively
