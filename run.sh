#!/bin/bash	
chown -R mysql:mysql /var/lib/mysql 

if [[ ! -d /var/lib/mysql/mysql ]]
then
  killall mysqld
  mysql_install_db
fi

if [[ ! -d /var/lib/mysql/felinpossible ]]
then
    set -e

    mysqld_safe &
    sleep 10s

	echo "Create felinpossible database..."

	mysql --user=root <<EOF
CREATE DATABASE felinpossible;
USE felinpossible;
GRANT ALL PRIVILEGES ON *.* TO 'felinpossible'@'localhost' identified by 'felinpossible' with grant option;
exit
EOF
  
    echo "DB felinpossible created"

    killall mysqld
fi

supervisord
