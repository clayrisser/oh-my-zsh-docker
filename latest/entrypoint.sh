#!/bin/sh

confd -onetime -backend env

exec /usr/sbin/sshd -D
