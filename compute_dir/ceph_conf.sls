/etc/ceph/ceph.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceph_conf/ceph.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
/etc/ceph/ceph.client.openstack.keyring:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceph_conf/client_keyring.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja


