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