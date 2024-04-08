# TODOs


## Initial setup I need to do

1. Buy a test domain (use mydigitalharbor.com and send it to VM, eventually to linode server)
2. Template out traefik config with Ansible if using a server, multiple domains + LE
3. Practice with terraform namecheap provider
    * deploy something to GH Pages with SSL and custom domain 
    * setup DNS to GH Pages from namecheap with terraform
4. think about repo setup... a monorepo would be ideal ,just a folder for each site

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

## Cloudfront

1. Terraform for deployment to cloudfront (cloudfront,s3, route 53?)
2. DNS with namecheap with or without route 53 I'm sure... not sure what the easiest way to do that is since idk exactly what route 53 accomplishes

## GH Pages (Can't stick with this for stripe)

1. Actions Setup to deploy to GH Pages
2. Terraform for namecheap DNS (I haven't done this successfully yet... need to practice)
