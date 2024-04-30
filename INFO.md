# INFO

This page includes some information to help understand the different components
involved in serving up a little link site and using a QR Code to navigate there

## Components

There are 4 main components to the little link + QR codes template

1. The site
2. Hosting the site
3. Domain / DNS
4. QR Codes

### The Site

At the end of the day the website is a folder with some html and images, the
main file can be opened up in a browser the same way you would open a Microsoft
Word Document with Microsoft Word... The browser will parse the HTML and render
in a window the clickable buttons and linked videos etc. Building the website
and styling it involves configuring the file appropriately, but the site as a
file is a different thing than someone being able to pull up the site on their
end in a browser

### Hosting the site

Hosting the website involves owning a webserver or subscribing to a web hosting
service that will serve up the site at a publically accessible endpoint. For
example, the example site for this repo is hosted on GitHub pages, and is
accessible at https://doompony.github.io/DigitalHarbor. There are a
lot of free hosting options out there with a ton of different features and
service models. For this case, GH Pages makes a ton of sense as a first
solution.

### Domain and DNS

Using a free service like GitHub Pages means that you don't control the URL. So
as mentioned above my site is being hosted on `doompony.github.io` at a route
`DigtalHarbor`. This isn't a business website or anything super
important for a brand so having a fancy URL is not a big deal... I just want
the site available on the internet. If the URL is important, for example you
want your little link site to be something cool like `https://1man1band.com`
then there are 3 more things to consider:

1. The domain
2. Ths hosing service
3. DNS

A domain like `1man1band.com` can be purchased through a service like Namecheap
(my recommendation) and others. The cost of a domain is dependant on the TLD
(top level domain) and the subdomain - ie. do you want a .com or a .xyz, and
then are you looking for something common like facebook.com or something more
niche like myuncommonlink.xyz

The hosting service aspect is really a wide open net - currently 1man1band.com
is hosted on Vercel, but GH Pages would be an option too.

DNS is the mechanism by which I type `1man1band.com` into my web broswer and
the eventual HTML File sitting somewhere is served up in my broswer. I handle
DNS with Namecheap and Cloudflare depending on the site.

### QR Codes

QR Codes are basically just math - given some text anyone can encode that text
into a QR code that a QR reader can then decode. Part of my services is that I
will provide branded or artistically crafted QR Codes for any link whether I am
handling the hosting of the link site or not, the only caveat to them is that
they are tied to the text... So if you choose `myurl.com` today and in the
future change your website to `mynewbiz.com` then all the QR Codes will still
point to `myurl.com`... Probably not surprising but worth mentioning.
