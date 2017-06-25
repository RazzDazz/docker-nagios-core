# docker-nagios

## Steps after first start
- Change password for nagios webadmin user

## Optimization & todos
- [ ] Get solution for setting nagiosadmin user passwort
- [ ] Supress a2enmode warning to set servername directive
- [ ] Start apache
- [ ] Start nagios
- [ ] Define VOLUMES
- [ ] Check Ports to EXPOSE
- [ ] Write docu how to change default password for nagios webadmin

## Workaround to start nagios
- open shell
- htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
- apache2ctl start
- /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
