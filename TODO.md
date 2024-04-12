# TODOs

domain: mydigitalharbor.com

## Git

Verify doomopny is empty and all DH stuff is in Org

## Initial setup I need to do

1. cloudflare/namecheap modules in terraform
2. Template out traefik config with Ansible if using a server, multiple domains + LE
4. create markata template from index.html and code to use Markdown and build with Markata

## Links/buttons

1. Add to example all the buttons I can support

## Domain and DNS

0. Buy domain from namecheap
1. Terraform namecheap for DNS setup
  * I can plan to just import what I setup for GH pages and then change it via terraform to my VM)

## Server deployment

0. Ansible for server setup
  * cron job on server to clone... easy
  * git obvi
1. Traefik config for multiple domains + LE (just one domain - will use CF pages for everyone else)
2. DNS to server with terraform namecheap
3. Actions setup to deploy code to server

## Hosting Roadmap

0. TODO: digitalharbor.com running on my server to handle stripe and stuff... currently it's static on gh pages (no terraform - would be nice to import)

v1 - digitalharbor.com/customer/ only

1. this is on Cloudflare pages, so SSL is handled for me on my domain and I can serve up routes easy

v2 - customer-domain.com

Option 0 - cloudflare pages WINNER WINNER
  - namecheap-ecosystem provider to setup namecheap domain dns to cloudflare dns
  - cloudflare pages configuration
  - cloudflare zone config is supported in terraform - see 1man1-band
  - TODO: tempalte and modularize this stuff in a way that makes sense
  - bring caribbean kings into here and josh's other sites... try to get 1man1.band to serve up his DH from here, not the seperate repo. If I can do that then the seperate repo thing won't be necessary at all... just need to run a github action that wrangler deploys
  - TODO: link organization github to a cloudflare account and use it for owner of all repos

Option 1 - point to my server
  - requires traefik + LE on server with multiple domains configured for traefik



## QR generation

1. play with locally hosted huggingface space
2. a1111 docker project, use just the api and create qr code pipeline. I need to copy models in or edit the download script to get the ones I need... probably the controlnt extension too somehow which maybe I can just do manually and then ship the data folder along with the docker image, or build a second one?
