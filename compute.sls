include:
  - openstack/compute_dir/compute_packages
  - openstack/compute_dir/networks
  - openstack/compute_dir/ovs
  - openstack/compute_dir/iptables
  - openstack/compute_dir/nova_conf
  - openstack/compute_dir/libvirt_conf
  - openstack/compute_dir/neutron_conf
  - openstack/compute_dir/ceph_conf
  - openstack/compute_dir/ceilometer_conf
  - openstack/compute_dir/cinder_conf
#services
#These service checks are done in the state files above.  Below are just sanity checks after all the states are run to make sure the services 
#stayed up.
neutron-openvswitch-agent:
  service.running:
    - enable: True
openstack-ceilometer-compute:
  service.running:
    - enable: True
openstack-nova-compute:
  service.running:
    - enable: True
    - watch: 
      - file: /etc/nova/nova.conf