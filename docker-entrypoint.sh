#!/bin/bash
if [ ! -f "/usr/local/nagios/etc/nagios.cfg" ] 
then
    echo "Copying files for first start to volume" 
    cp -r /usr/local/nagios/etc-ori/* /usr/local/nagios/etc/
fi

echo "Starting supervisord ..." 
exec /usr/bin/supervisord --nodaemon --configuration /tmp/supervisor_nagios.conf
