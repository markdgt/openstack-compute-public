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