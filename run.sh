#!/bin/bash  
INIT_DB_SCRIPT=/var/www/felinpossible/install/sql/light_dump.sql

chown -R mysql:mysql /var/lib/mysql 

if [[ ! -d /var/lib/mysql/mysql ]]
then
  killall mysqld
  mysql_install_db
fi

if [[ ! -d /var/lib/mysql/felinpossible ]]
then
  set -e

  if [ -f ${INIT_DB_SCRIPT} ]
  then
    mysqld_safe &
    sleep 10s

    echo "Create felinpossible database..."
    mysql --user=root < ${INIT_DB_SCRIPT}
    echo "DB felinpossible created"

    killall mysqld
  else
    echo "Init dump file ${INIT_DB_SCRIPT} not found"
    exit 1
  fi
fi

supervisord -c /etc/supervisor/conf.d/supervisord.conf
