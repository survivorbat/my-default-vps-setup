# My default vps setup

I like to spin up and murder a few DigitalOcean droplets every now and then but the amount of
effort that goes into setting them up was kind of a buzzkill. I could also have just
used images but I decided to just have some fun and make an Ansible script to do it for me.

## What does it do?

This script does a few things on a remote host, namely:
- Install Python, this is required for Ansible to function
- Download packages like pip, docker and certbot
- Create two users that I often use with credentials and proper groups

After this I can directly ssh into one of my machines without using the root account which
is quite convenient. 

## Prerequisites

I set up a Makefile to make it easy to deploy dynamically to servers, make is not an
essential requirement but it does make it easier to deploy to hosts.

The most important requisite is ansible-playbook, since this will be used
to kick off the yaml scripts.

## Getting started

Since this script is for my personal use it might be a bit hard to set up for other people.
If you however want to try it out for yourself you'd have to do a few things:

1. Clone the repository
2. Add a .vault-password file in ../ with the vault password OR change user passwords and keys to your own in `group_vars/all.yml`
3. Run `make run ips='example.com example.nl example.org'` to start deploying to a remote host

And that's it! If everything goes well you'll be able to ssh into your own server and
get the party started.

## Future updates

As I learn more about server security and DevOps each day I'll probably update this script
to reflect my new knowledge and to further improve my droplet setup script. 