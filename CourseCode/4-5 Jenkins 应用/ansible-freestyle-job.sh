#!/bin/sh

set +x
source /home/deploy/.py3-a2.5-env/bin/activate
source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q

cd /home/deploy
ansible --version
ansible-playbook --version

cat testservers

ansible -i testservers testserver -m command -a "ip addr"
set -x