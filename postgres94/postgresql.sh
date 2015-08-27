#!/bin/sh
exec /sbin/setuser postgres /usr/lib/postgresql/9.4/bin/postgres -D /var/lib/postgresql/9.4/main -c config_file=/etc/postgresql/9.4/main/postgresql.conf >>/var/log/postgresql.log 2>&1
