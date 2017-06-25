# docker-nagios

## Optimization & todos
- [ ] Get solution for setting nagiosadmin user passwort
- [ ] Supress a2enmode warning to set servername directive
- [ ] Start apache
- [ ] Start nagios
- [ ] Define VOLUMES
- [ ] Check Ports to EXPOSE

## Workaround to start nagios
- open shell
- htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
- apache2ctl start
- /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
