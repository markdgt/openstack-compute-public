compute.packages:
  pkg.installed:
    - pkgs:
      - qemu-kvm-rhev
      - libvirt
      - openvswitch
      - openstack-nova-compute
      - python-cinderclient
      - rabbitmq-server
      - ceph-common
      - openstack-ceilometer-compute
      - openstack-selinux
      - python-cinderclient
      - openstack-cinder

compute_net.packages:
  pkg.installed:
    - pkgs:
      - openstack-neutron-lbaas
      - openstack-neutron-ml2
      - python-neutronclient
      - python-neutron-lib
      - openstack-neutron-bigswitch-lldp
      - openstack-neutron-metering-agent
      - openstack-neutron-openvswitch