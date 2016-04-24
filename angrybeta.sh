#!/bin/bash

if [ ! -f /root/.ssh/id_rsa ]
then
    cp /var/private/id_rsa /root/.ssh/id_rsa &&
    chmod 0600 /root/.ssh/id_rsa
    true
fi &&
if [ -d /srv/.git ]
then
    git -C /srv fetch origin master &&
    git -C /srv rebase origin/master &&
    git -C /srv push origin master &&
    true
    fi &&
true
