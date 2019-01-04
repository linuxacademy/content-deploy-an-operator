#!/bin/bash
# installer script for OLM on OpenShift v3.11
rm -rf /etc/ansible/hosts
curl -o /etc/ansible/hosts https://raw.githubusercontent.com/linuxacademy/content-deploy-an-operator/master/etc/ansible/hosts
curl -o /var/tmp/images.sh https://raw.githubusercontent.com/linuxacademy/content-deploy-an-operator/master/etc/ansible/hosts
/bin/bash /var/tmp/images.sh
sleep 5
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/olm/config.yml
