#!/bin/sh

confd -onetime -backend env
/usr/sbin/sshd -D &

exec /bin/zsh "$@"
