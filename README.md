# Minionizer Demo

This repo is intended to server as a demonstration of how to use the Minionizer gem
to provision a server.

As Minionizer (which is still in beta) is updated, this repo will be subsequently
updated as well to demonstrate more features.

## Test Drive

You can run this demo yourself to experiment. It is designed to work with a fresh 
Digital Ocean Ubuntu 14.04 64bit droplet. It may also work with a local VM or other
cloud hosted server that's preconfigured to mimic a DigitalOcean droplet (primarily, 
defaulted to root being able to initially ssh in).

The plan is eventually to have branches of this repo that demonsrate the equivalent
behavior for other cloud server providers, such as AWS.  Until then though, you can
run this demo against a Digital Ocean droplet by following these steps.

1. Login to Digital Ocean and create a droplet with the following options.
    1. Choose the smallest/cheapest available size. More expensive servers are no
       more effective at demonstrating minionizer.
    2. Choose Ubuntu 14.04 x64
    3. Add your local ssh key, OR when they email you the initial password, you'll
       need to add it to the ssh section in the config file (not recomended for 
       real servers)
2. After the droplet is created, update your hosts file to add the ip address
   with the hostname 'demo.minionizer.int'             
3. Clone this repo locally and run `minionize demo` from the root of the repo.
 
