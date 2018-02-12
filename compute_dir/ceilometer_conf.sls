/etc/ceilometer/ceilometer.conf:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/ceilometer_conf.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/api_paste.ini:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/api_paste_ini.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/event_definitions.yaml:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/event_definitions_yaml.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/event_pipeline.yaml:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/event_pipeline_yaml.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/gnocchi_resources.yaml:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/gnocchi_resources_yaml.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/meters.yaml:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/meters_yaml.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/pipeline.yaml:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/pipeline_yaml.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja
/etc/ceilometer/policy.json:
  file.managed:
    - source: salt://openstack/compute_dir/templates/ceilo_conf/policy_json.jinja
    - user: root
    - group: ceilometer
    - mode: 640
    - template: jinja