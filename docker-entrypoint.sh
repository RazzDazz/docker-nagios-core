#!/bin/bash
if [ ! -f "/usr/local/nagios/etc/nagios.cfg" ] 
then
    echo "Copying files for first start to volume" 
    cp -r /usr/local/nagios/etc-ori/* /usr/local/nagios/etc/
    echo "Create defualt httpasswd. Log into terminal and run: 'htpasswd -bc /usr/local/nagios/etc/htpasswd.users ${NAGIOS_WEBADMIN_USER} <yourpassword>'" 
    htpasswd -bc /usr/local/nagios/etc/htpasswd.users ${NAGIOS_WEBADMIN_USER} ${NAGIOS_WEBADMIN_START_PASSWORD}
fi

echo "Starting supervisord ..." 
exec /usr/bin/supervisord --nodaemon --configuration /tmp/supervisor_nagios.conf
