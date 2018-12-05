# Ansible role for sbws

This role should deploy and configure the Tor bandwidth scanner sbws running
as a non-root user with Caddy running as a webserver. Caddy-ansible role is used
to install Caddy used here as submodule with few default variables changed (in
[roles/sbws-ansible/defaults/main.yml](./roles/sbws-ansible/defaults/main.yml)).
It is based and been tested for Debian based distributions.

Optional: This role can install and generate vnstat graphs and display them on
the index page
[roles/sbws-ansible/defaults/index.html.j2](./roles/sbws-ansible/defaults/index.html.j2).
To enable vnstat graphs generation set `vnstat_install` to `yes`.

## Clone

You can clone the sbws-ansible repository and its submodule with:

```
git clone --recursive https://github.con/anadahz/sbws-ansible
```

## Configure

Add your host(s) in the inventory (`inventory/hosts`) and adjust the `host_vars`
file (`vars.yml`), see examples in
[inventory/hosts.example](./inventory/hosts.example) and
[host_vars.example](./host_vars.example) accordingly.

You can override any defaults declared in
[roles/sbws-ansible/defaults/main.yml](./roles/sbws-ansible/defaults/main.yml)
by adding your preferred variable(s) in `host_vars` file.

## Install

You can deploy the sbws role by running:

```
ansible-playbook -i inventory/hosts setup.yml
```

### (Optional) Use a vault file

1. Encrypt inventory or other file(s)

```
ansible-vault encrypt inventory/host_vars/host.example.org/vars.yml
```

2. Deploy sbws role with vault (you will be prompted for the vault's password)

```
ansible-playbook --vault-id @prompt -i inventory/hosts setup.yml
```

### Sources

* [sbws](https://gitweb.torproject.org/sbws.git)
* [ansible-caddy](https://github.com/antoiner77)
* [Ansible vault documentation](https://docs.ansible.com/ansible/latest/cli/ansible-vault.html)
* [vnstat template](https://j0hn.uk/vnstati/)
