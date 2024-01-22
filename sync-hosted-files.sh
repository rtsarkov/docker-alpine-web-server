#!/usr/bin/env bash
clear

# Sync to
DIR_LOCAL="/home/<username>/html/";

# Sync from
SSH_HOST='user_name@xxx.xxx.x.xxx';
PORT_HOST='22';
DIR_HOST="/var/www/html/";


rsync -zarlPLi -e "ssh -i /home/<username>/.ssh/id_rsa -p ${PORT_HOST}" ${SSH_HOST}:${DIR_HOST} ${DIR_LOCAL}
