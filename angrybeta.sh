#!/bin/bash

if [ ! -f /root/.ssh/id_rsa ]
then
    cp /var/private/id_rsa /root/.ssh/id_rsa &&
    chmod 0600 /root/.ssh/id_rsa
    true
fi &&
if [ ! -d /srv/repository ]
then
    mkdir /srv/repository &&
    git -C /srv/repository init &&
    git -C /srv/repository remote add origin ${GIT_URL} &&
    git -C /srv/repository fetch origin master &&
    git -C /srv/repository checkout master &&
    true
fi &&
git -C /srv/repository fetch origin master &&
git -C /srv/repository rebase origin/master &&
git -C /srv/repository push origin master &&
true
