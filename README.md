# Ansible

## Installation[1]

Install ansible core, required collection modules and module dependencies

```
  sudo apt install ansible python3-pip rubygems shellcheck        # Ubuntu
  sudo dnf install ansible python3-pip rubygems shellcheck        # RedHat
```

```
  pip3 install pre-commit
```

`Enable pre-commit hook`

```
git config --local core.hooksPath .githooks/
```

## Collections

Install collection modules

```
ansible-galaxy collection install --requirements-file collections/requirements.yml
```

## Modules

Install module dependency

```
sudo apt install ufw firewalld python3-apt                        # Ubuntu 20.XX
sudo apt install ufw firewalld python3-apt python3-dnf            # Ubuntu 21.XX
sudo dnf install ufw firewalld python3-apt python3-dnf            # RedHat
```

```
pip3 install pynetbox proxmoxer requests netaddr
```

## [Configuration file](https://docs.ansible.com/ansible/latest/reference_appendices/config.html)

Changes can be made and used in a configuration file
which will be searched for in the following order:

* `ANSIBLE_CONFIG` (environment variable if set)
* `ansible.cfg` (in the current directory)
* `~/.ansible.cfg` (in the home directory)
* `/etc/ansible/ansible.cfg` (system global config)

No extra modifications are not needed yet.
Modified configuration is located in project current directory.

```
ansible.cfg
```

## Structure

---

### Project

```
├── ansible.cfg               # config overrides for current project
├── collections               # folder for external collections modules
├── group_vars                # here we assign variables to particular groups
├── host_vars                 # if systems need specific variables, put them here
├── library/                  # if any custom modules, put them here (optional)
├── inventory                 # folder for inventory files
├── README.md                 # project overview and description
├── roles                     # folder for created roles
│   └── demo_role
├── deploy_db.yml             # playbook for deploy db delivery
```

### Role[2]

```
demo_role
├── defaults                  # contains the default variables used by this role
│   └── main.yml
├── files                     # contains files that can be deployed by this role
├── handlers                  # contains handlers which may be used by this role
│   └── main.yml
├── meta                      # defines metadata for this role and dependencies
│   └── main.yml
├── README.md                 # role overview and description
├── tasks                     # the main list of tasks to be executed by role
│   └── main.yml
├── templates                 # folder for jinja templates used by this role
│   └── template.conf.j2
├── tests                     # not used yet, but some tools requires this structure
│   ├── inventory
│   └── test.yml
└── vars                      # overrides default variables for this role
    └── main.yml
```

### Role init

```
cd roles
ansible-galaxy role init demo_role
```

### Inventory[3]

Inventory files are located in inventory folder.
Separated to subfolders according environments.

```
  inventory/dev
  inventory/test
```

### Variables[4]

Variables are mainly located inside each role in default folder.

* [facts and magic variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html#vars-and-facts)
* [variables precedence](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#understanding-variable-precedence)

```
  roles/*/defaults/main.yml
```

### Playbooks

These tips and tricks[5] have helped us optimize our Ansible usage

## Pre-commit

---

Project contains pre-commit hooks, that execute following checks

```
* ansible-lint                # ansible syntax check according to .ansible-lint,.yamllint
* codespell                   # typo correction in names
* shellcheck                  # syntax check for shell scripts
* markdownlint                # syntax check for README.md
* ansible-nwd                 # generate/regenerate README.md for roles
```

Pre-commit hook can be manually fired by command

```
pre-commit run --all-files --verbose
```

## Roles

---

Quick role verview. Contains short description,
used tags and variables, supported OS and it's versions.

* [base_server](roles/base_server/README.md)

[1]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-specific-operating-systems
[2]: https://www.devopsroles.com/ansible-roles-directory-structure-explained/
[3]: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html
[4]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html
[5]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html
