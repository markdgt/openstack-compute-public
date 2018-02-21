#This is one of these state files that could use modules instance of jinja/templates.
#However, since neutron controls the iptables on the node it expects iptables to be a certain state so this makes more since for my setup.

iptables:
  file.managed:
    - name: /etc/sysconfig/iptables
    - source: salt://openstack/compute_dir/templates/iptables.jinja
    - user: root
    - group: root
    - mode: 600
    - template: jinja
  service.running:
    - name: iptables
    - enable-: True
    - watch:
      - file: /etc/sysconfig/iptables
neutron-ovs-iptables:
  service.running:
    - name: neutron-openvswitch-agent
    - enable: True
    - watch:
      - file: /etc/sysconfig/iptables