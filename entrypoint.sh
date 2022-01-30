#!/bin/sh
# Setting permissions on /home/me
chown -R me: /home/me
# Setting permissions on docker.sock
chown me: /var/run/docker.sock
