ovs_services:
  service.running:
    - name: openvswitch
    - enable: True
  require:
    - pkg:
      - openvswitch
br-ex:
  openvswitch_bridge.present: []
br-int:
  openvswitch_bridge.present: []
br-tun:
  openvswitch_bridge.present: []

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