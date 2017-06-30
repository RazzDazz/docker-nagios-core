# docker-nagios-core

Docker container to run a nagios core based on ubuntu. Tested plattform is a synology nas (RS815+). Should run in a regular docker. But not tested.

## Prerequisites
- Docker Syno App installed

## Installing
1. Download docker image
2. Start Image and use assistant
3. Advanced Button
    1. Mount volumes
        * nagios config files: `/usr/local/nagios/etc`
        * log files: `/var/lib/log/supervisor`
    2. Choose specific port or use automatic
    3. Click OK
4. Finish and autorun container

## First start
The start script checks volume `/usr/local/nagios/etc` if a file `nagios.cfg` exists. 
If not found then the folder `/usr/local/nagios/etc-ori` (a copy of `/usr/local/nagios/etc` created during docker build) is copied back to `/usr/local/nagios/etc`. From this point you can adjust the default config to your needs. 

## Test
### nagios url
Open webbrowser and browse to`http://<localhost>:<port>/nagios`
### Default credentitials
* login: nagiosadmin
* password: nagios

## Steps after first start
### Change password for nagios webadmin user
* Open terminal in run the command `htpasswd -bc /usr/local/nagios/etc/htpasswd.users ${NAGIOS_WEBADMIN_USER} <password>`

## Optimization & todos
- [ ] Supress a2enmode warning to set servername directive
