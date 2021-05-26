Base_server
===========

Description
-----------

Install and configure base Linux virtuals servers


Dependencies
-----------
This role has no dependencies.

Requirements
-------------

### Ansible version

Minimum Ansible version : 2.9

### Platforms

This role will work on the following platforms :

Distribution | Version |
--- | --- |
CentOS Stream | 8 |
OracleLinux | 8 |
Ubuntu | 20 |

Tasks tags
--------------

These tasks tags are available :

* ``c-base``

* ``c-network``

* ``c-sshd``

* ``c-sysctl``

* ``c-time``

* ``c-tools``

* ``configure``

* ``install``

Role Variables
--------------

Variable | Type | Mandatory |  Example | File | Description
--- | --- | --- | --- | --- | --- |
`hostvars[inventory_hostname].ansible_dns.nameservers`  | list | true | ['1.1.1.1', '9.9.9.9'] | main.yml |  DNS servers for system |
`hostvars[inventory_hostname].dns_name`  | string | true | 'app01.dev.wc' | main.yml |  system fqdn |
`hostvars[inventory_hostname].primary_ip4`  | string | true | '192.168.1.1' | main.yml |  system primary ipv4 |
`hostvars[inventory_hostname].time_servers`  | list | true | ['ntp01', 'ntp02'] | main.yml |  system time servers |
`hostvars[inventory_hostname].time_zone`  | string | true | 'Europe/Prague' | main.yml |  system timezone |
`provisioning_os_user.user`  | string | true | 'deploy' | main.yml |  provisioning user name |
`provisioning_os_user.group`  | string | true | 'deploy' | main.yml |  provisioning user group |
`provisioning_os_user.home`  | string | true | '/home/user' | main.yml |  provisioning user home path |


Default Variables
------------------

Variable | Value | Description | Type | File
--- | --- | --- | --- | --- |
``base_server_ssh_port_default`` | 22  | set sshd listen port | int | main.yml
``base_server_root_password`` |  [value](defaults/)  | n/a | n/a | 

Molecule scenario
------------------

Author
-------

operations@apollogames.com