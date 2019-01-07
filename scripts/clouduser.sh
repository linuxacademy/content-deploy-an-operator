#!/bin/bash

/bin/sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
chattr +i /etc/ssh/sshd_config
systemctl restart sshd

