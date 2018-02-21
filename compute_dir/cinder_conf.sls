#Simple jinja/template key/value swaps with openstack/pass pillars.
/etc/cinder/cinder.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/cinder_conf/cinder_conf.jinja
    - user: root
    - group: cinder
    - mode: 640
    - template: jinja