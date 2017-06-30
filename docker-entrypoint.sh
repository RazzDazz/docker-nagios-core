#!/bin/bash
if [ ! -f "/usr/local/nagios/etc/nagios.cfg" ] 
then
    echo "Copying files for first start to volume" 
    cp -r /usr/local/nagios/etc-ori/* /usr/local/nagios/etc/
fi

# set -e
# if [ "$1" = 'postgres' ]; then
#    chown -R postgres "$PGDATA"
#    if [ -z "$(ls -A "$PGDATA")" ]; then
#        gosu postgres initdb
#    fi
#    exec gosu postgres "$@"
# fi
# exec "$@"
echo "Starting supervisord ..." 
# exec /usr/bin/supervisord --nodaemon -configuration /tmp/supervisor_nagios.conf
