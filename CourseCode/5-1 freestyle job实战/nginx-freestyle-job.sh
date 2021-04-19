#/bin/sh

set +x
source /home/deploy/.py3-a2.5-env/bin/activate
source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q

cd $WORKSPACE/nginx-playbooks
ansible --version
ansible-playbook --version

ansible-playbook -i inventory/$deploy_env ./deploy.yml -e project=nginx -e branch=$branch -e env=$deploy_env