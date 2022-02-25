General.System.set-usersandgroups
=========

Create/Edit system users

Requirements
------------

Linux OS

Role Variables
--------------

set_users_json: path to Json file that contains list of users to create and their options. Example file can be found in files/ directory of this role.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Example of invocation from playbook:

    - hosts: servers
      roles:
         - { role: general/system/roles/set-usersandgroups, set_users_json: /config/users.json }

Example of invocation from playbook:

    - name: Create system users
      import_role:
        name: collections/general/system/roles/set-usersandgroups
      vars:
        set_users_json: /config/users.json

Example of invocation from command line using external file as settings:

    ansible-playbook playbook.yml -v --extra-vars '{"set_users_json":"/Conf/hosts/server1/users.json"}'

License
-------

BSD

Author Information
------------------

https://github.com/vwares/
