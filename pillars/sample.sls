#This is used by my salt setup and not necessarily needed for yours.  
roles: ['compute']


#This file is default values used across the entire cluster. 
#This is the biggest reason I use Jinja/template combo instead of state modules.
include:
  - openstack/pass

#Not used at the moment.  Hoping to setup slaves with salt stack at some point and this will be useful.
bonding:
  slaves: ['eno1','eno2']

#These networks are necessary for a node to be on for my infrastructure.  If you have a different infrastructure you'll need to change this (salt to taste?)
networks:
  Control_plane:
    ip: '172.31.23.154'
    vlan_tag: 'None'
  Internal_api:
    ip: '172.23.16.237'
    vlan_tag: '2516'
  Tenant:
    ip: '172.23.18.237'
    vlan_tag: '2518'
  Storage:
    ip: '172.31.17.237'
    vlan_tag: '2317'