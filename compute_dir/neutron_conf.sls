#Simple jinja/template key/value swaps with openstack/pass pillars.
/etc/neutron/neutron.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/neutron_conf/neutron.conf.jinja
    - user: root
    - group: neutron
    - mode: 640
    - template: jinja
  service.running:
    - name: neutron-openvswitch-agent
    - watch:
      - file: /etc/neutron/neutron.conf
/etc/neutron/plugins/ml2/ml2_conf.ini:
  file.managed:
    - source: salt://openstack/compute_dir/templates/neutron_conf/plugins/ml2/ml2_conf.ini
    - user: root
    - group: neutron
    - mode: 640
    - template: jinja
  service.running:
    - name: neutron-openvswitch-agent
    - watch:
      - file: /etc/neutron/plugins/ml2/ml2_conf.ini
/etc/neutron/plugins/ml2/openvswitch_agent.ini:
  file.managed:
    - source: salt://openstack/compute_dir/templates/neutron_conf/plugins/ml2/openvswitch_agent.ini
    - user: root
    - group: neutron
    - mode: 640
    - template: jinja
  service.running:
    - name: neutron-openvswitch-agent
    - file: /etc/neutron/plugins/ml2/openvswitch_agent.ini
/etc/neutron/plugin.ini:
  file.symlink:
    - target: /etc/neutron/plugins/ml2/ml2_conf.ini
