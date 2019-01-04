#!/bin/bash
# installer script for OLM on OpenShift v3.11
echo "Please wait while installer completes. The process may take 5-10
minutes." >> /etc/motd
rm -rf /etc/ansible/hosts
curl -o /etc/ansible/hosts https://raw.githubusercontent.com/linuxacademy/content-deploy-an-operator/master/etc/ansible/hosts
curl -o /var/tmp/images.sh https://raw.githubusercontent.com/linuxacademy/content-deploy-an-operator/master/scripts/install-olm.sh
/bin/bash /var/tmp/images.sh
sleep 5
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/olm/config.yml
&& echo "Installation complete! You may now begin your lab."
