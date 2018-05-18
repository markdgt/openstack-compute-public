# openstack-compute

## Deploying an openstack Compute node using Saltstack 
This assumes you already have a Control Plane with the following components:

[Controller Components](ControllerReqs.md)

For deeper details on how this is used with TripleO go here:

[User Group Discussion](Cloud-Update.pdf)

# State Modules VS Jinja

I use mostly jinja templates vs state modules even  though modules like firewalls, network interfaces and openstack services exist because most of the values in this config files are default across the cluster except for a few values..

# Pillars
I have my pillars outside my state files for security purposes so I've created a sample pillar directory for examples only.  These will need to be moved to your pillar directory

# Workflow/Outline

State Files:

When the 'compute' role is set in the pillar file, we execute the compute statefile 

	compute.sls

The compute.sls installs the compute rpm packages:

	 compute_dir/compute_packages.sls

	Basic Package requirements for openstack-nova and neutron to function.

And setups up the openstack networking interfaces:

	compute_dir/networks
		Takes the networks dict() 'sample to the right' -------->
		And creates an interface for each 'key'
		ToDO: create watches for each interface to 'HUP' the interface if changed.
		
Make sure OVS is setup:

	compute_dir/ovs
	Installs packages, starts the service.  
	I also make sure the br-int,br-tun and br-ex bridges are present. 
	
Configure default iptables:

	compute_dir/iptables.sls
	A stop gap to make sure a firewall is in place until neutron takes over.
Configuring Compute Services:


## Configurations
More or less just key/value templates, using the openstack/pass.sls state file. Actions noted below otherwise:

State File for configuring nova  configs:

	compute_dir/nova_conf
	We configure the KVM -> Ceph secret config in this file.  
	Consolidate with the ceph conf below?

State file for configuring libvirt:

	compute_dir/libvirt_conf
           Installing and configuring libvirtd 
	Making sure the service is running
	Defining the ceph secret variable using (virsh secret-define)
State file for configuring neutron configs:

	compute_dir/neutron_conf

State file for configuring ceph configs:

	compute_dir/ceph_conf

State file for configuring ceilometer configs:

	compute_dir/ceilometer_conf

State file for configuring cinder configs:

	compute_dir/cinder_conf
