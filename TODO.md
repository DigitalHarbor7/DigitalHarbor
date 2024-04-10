# TODOs


## Initial setup I need to do

1. Buy a test domain (use mydigitalharbor.com and send it to VM, eventually to linode server)
2. Template out traefik config with Ansible if using a server, multiple domains + LE
3. Practice with terraform namecheap provider
    * deploy something to GH Pages with SSL and custom domain 
    * setup DNS to GH Pages from namecheap with terraform
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
1. Traefik config for multiple domains + LE
2. DNS to server with terraform namecheap
3. Actions setup to deploy code to server

## Hosting Roadmap

v1 - digitalharbor.com/customer/ only

1. this is on GH pages, so SSL is handled for me on my domain and I can serve up routes easy

v2 - customer-domain.com

0. digitalharbor.com running on my server

Option 1 - point to my server
  - requires traefik + LE on server with multiple domains configured for traefik

Option 2 - cloudflare pages
  - namecheap-ecosystem provider to setup namecheap domain dns to cloudflare dns
  - cloudflare pages configuration

Option 3 - AWS CloudFront 
  - cloudfront + route53 with a CNAME record in namecheap pointing to the route53 dns hosted zone.


## Cloudfront

1. Terraform for deployment to cloudfront (cloudfront,s3, route 53?)
2. DNS with namecheap with or without route 53 I'm sure... not sure what the easiest way to do that is since idk exactly what route 53 accomplishes



## GH Pages (Can't stick with this for stripe)

1. Actions Setup to deploy to GH Pages
2. Terraform for namecheap DNS (I haven't done this successfully yet... need to practice)

## QR generation

1. play with locally hosted huggingface space
2. a1111 docker project, use just the api and create qr code pipeline. I need to copy models in or edit the download script to get the ones I need... probably the controlnt extension too somehow which maybe I can just do manually and then ship the data folder along with the docker image, or build a second one?
