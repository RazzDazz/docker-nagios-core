# docker-nagios

## Optimization & todos
- [ ] Get Solution for seting nagiosadmin user passwort
- [ ] Supress a2enmode warning to set servername directive
- [ ] Start Apache
- [ ] Start Nagios
- [ ] Define VOLUMES
- [ ] Check Ports to EXPOSE

## Workaround to start nagios
- open shell
- htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
- apache2ctl start
- /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
