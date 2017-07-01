#!/bin/bash
if [ ! -f "/usr/local/nagios/etc/nagios.cfg" ] 
then
    echo "Copying files for first start to volume..." 
    cp -r /usr/local/nagios/etc-ori/* /usr/local/nagios/etc/
    echo "Creating default httpasswd..."
    htpasswd -bc /usr/local/nagios/etc/htpasswd.users ${NAGIOS_WEBADMIN_USER} ${NAGIOS_WEBADMIN_START_PASSWORD}
    echo "Log into terminal and change default password."
    echo "Run: 'htpasswd -bc /usr/local/nagios/etc/htpasswd.users ${NAGIOS_WEBADMIN_USER} <yourpassword>'" 
fi

echo "Starting supervisord to run nagios ..." 
exec /usr/bin/supervisord --nodaemon --configuration /tmp/supervisor_nagios.conf
