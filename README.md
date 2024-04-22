# Digital Harbor

[![☁ ️Deploy to Cloudflare Pages](https://github.com/DigitalHarbor7/DigitalHarbor/actions/workflows/cloudflare-pages-deployment.yml/badge.svg)](https://github.com/DigitalHarbor7/DigitalHarbor/actions/workflows/cloudflare-pages-deployment.yml)

[![🌱 Deploy site to GH Pages](https://github.com/DigitalHarbor7/DigitalHarbor/actions/workflows/github-pages-deployment.yml/badge.svg)](https://github.com/DigitalHarbor7/DigitalHarbor/actions/workflows/github-pages-deployment.yml)

## Sales Pitch

Problem: You want a simple website to serve as a one-stop shop for all the
links related to you - YouTube, Patreon, Venmo, Show Calendar, Google Review, etc. You'd also
like a kick-awesome QR Code for your followers to simply scan and be brought to
that site... But you aren't sure where to start!

I'm here to help by building your [Digital Harbor](https://mydigitalharbor.com)

The cost to build your site is one-time fee of $100, and I remain available for edits and discussion. From there the options are...

1. hand it off to you and you handle hosting
2. host it at `https://mydigitalharbor.com/{Your Route}` for $5/month. [Example](https://mydigitalharbor.com/1man1-band)
3. host it at a custom domain: $100 Domain Setup (DNS, SSL, etc.) + $10/month + Domain Cost [1man1band.com](https://1man1band.com)

## QR Codes

# TODO: this example page
I will create branded QR Codes for your link page or existing website - see examples [here](https://mydigitalharbor.com/qr-branded)

# TODO: change link to qr-stable-diffusion or something
I also can create custom QR codes that are highly artisan. See examples [here](https://mydigitalharbor.com/qr) and please contact me for inquiries at mydigitalharbor@pype.dev

## Services

1. Your Digital Harbor is inspired from the [Little Link](https://littlelink.io) project. Your Digital Harbor is built with tailwind css and uses [simpleicons](https://simpleicons.org)
2. I host your page for you (the main service of Digital Harbor)
3. Branded QR Codes
4. Artisanal QR Codes generated with Stable Diffusion

## Roadmap
- Custom and interactive button design (Coming Soon)
- Other providers besides namecheap for DNS
- Analytics!

## Build process

Site can be updated from DigitalHarbor or from whatever repo the site-configs are in, currently the generator repo.
In this repo, on develop or main a workflow runs which checks-out pages-dev or pages, rebases onto develop or main, and then pushes back which will kick off the workflow to deploy to cloudflare. This is when I want to update the landing page or qr examples.
Customer sites generated with my configuration get built in another repo, and in a workflow for develop/main that repo copies the generated site into pages-dev/pages branch of DigitalHarbor (there should never be git conflicts since the files touched should always be completely different) and force pushes to that branch, which should only ever include customer site updates
