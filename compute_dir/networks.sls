#Dependant on the pillar file for the node.  See sample pillar file.  

#Loops through the networks specified in the networks pillar and configures the node on those networks.
{% for net, args in pillar.get('networks', {}).items() %}
/etc/sysconfig/network-scripts/ifcfg-Vlan{{ net }}:
  file.managed:
    - template: jinja
    - source: salt://openstack/compute_dir/templates/interface_template.jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        ip: {{ args['ip'] }}
        tag: {{ args['vlan_tag'] }}
{% endfor %}

#Places the main bonded network interface on the Openvswitch bridge neccessary for external instance access
/etc/sysconfig/network-scripts/ifcfg-bond0:
  file.managed:
    - match: grain
    - template: jinja
    - source: salt://openstack/compute_dir/templates/bond_template.jinja
    - user: root
    - group: root
    - mode: 644

network:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/sysconfig/network-scripts/ifcfg-bond0