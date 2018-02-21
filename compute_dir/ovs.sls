#Installs required Openvswitch packages.  Sets up the ovs bridges openstack uses to provide network access to instances

ovs_services:
  service.running:
    - name: openvswitch
    - enable: True
  require:
    - pkg:
      - openvswitch

# External Bridge to give instances external network access
br-ex:
  openvswitch_bridge.present: []

# Internal Bridge used to give instances access to other instances that apart of their network.
br-int:
  openvswitch_bridge.present: []

# Tunneling bridge.  Used to give vxlan capsulation for the Internal bridge networks between openstack nodes
br-tun:
  openvswitch_bridge.present: []

#Statically sets up the external bridge so that if openstack services fail the instance still maintains access to external networks
/etc/sysconfig/network-scripts/ifcfg-br-ex:
  file.managed:
    - match: grain
    - template: jinja
    - source: salt://openstack/compute_dir/templates/br_ex_template.jinja
    - user: root
    - group: root
    - mode: 644
network_ovs:
  service:
    - name: network
    - running
    - enable: True
    - watch:
      - file: /etc/sysconfig/network-scripts/ifcfg-br-ex