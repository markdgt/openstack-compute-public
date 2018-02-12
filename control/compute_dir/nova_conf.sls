/etc/nova/nova.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/nova_conf/nova_conf.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
/etc/nova/api-paste.ini:
  file.managed:
    - source: salt://openstack/compute_dir/templates/nova_conf/api-paste.ini.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
/etc/nova/policy.json:
  file.managed:
    - source: salt://openstack/compute_dir/templates/nova_conf/policy.json.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
/etc/nova/rootwrap.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/nova_conf/rootwrap.conf.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
nova_secret:
  file.managed:
    - name: /etc/nova/secret.xml
    - source: salt://openstack/compute_dir/templates/nova_conf/secret.xml.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja
virsh_secret:
  file.managed:
    - name: /etc/nova/virsh.secret
    - source: salt://openstack/compute_dir/templates/nova_conf/virsh.secret.jinja
    - user: root
    - group: nova
    - mode: 640
    - template: jinja