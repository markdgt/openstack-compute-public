# openstack-compute

## Deploying an openstack Compute node using Saltstack 
This assumes you already have a Control Plane with the following components:

[Controller Components](ControllerReqs.md)

For deeper details on how this is used with TripleO go here:

Ask me for access the sharepoint link ;(

#State Modules VS Jinja

I use mostly jinja templates vs state modules even  though things like firewalls, network interfaces and openstack services exist.

#Pillars
I have my pillars outside my state files for security purposes so I've created a sample pillar directory for examples only.  These will need to be moved to your pillar directory