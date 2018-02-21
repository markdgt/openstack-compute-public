#Making sure qemu/kvm/libvirt is installed and configured.
libvirt:
  pkg.installed: []
  file.managed:
    - name: /etc/sysconfig/libvirtd
    - contents: 'LIBVIRTD_ARGS="--listen"'
    - require:
      - pkg: libvirt
  service.running:
    - name: libvirtd
    - file: libvirt

#These states are used to define kvm authorization to ceph disk stores.
libvirt_secret_define:
  cmd.run:
    - name: virsh secret-define --file /etc/nova/secret.xml
    - unless: "virsh secret-get-value {{ pillar['rbd_secret'] }}"
    - require: 
      - file: nova_secret
libvirt_secret_value:
  cmd.run:
    - name: virsh secret-set-value --secret {{ pillar['rbd_secret'] }}  --base64 {{ pillar['CephClientKey'] }}
    - unless: "[ '{{ pillar['CephClientKey'] }}' = `virsh secret-get-value {{ pillar['rbd_secret'] }}` ]"
    - require: 
      - file: virsh_secret