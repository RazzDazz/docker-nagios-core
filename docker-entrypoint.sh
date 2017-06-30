#!/bin/bash
cp -r /usr/local/nagios/etc-ori/* /usr/local/nagios/etc/

# set -e
# if [ "$1" = 'postgres' ]; then
#    chown -R postgres "$PGDATA"
#    if [ -z "$(ls -A "$PGDATA")" ]; then
#        gosu postgres initdb
#    fi
#    exec gosu postgres "$@"
# fi
# exec "$@"
