#!/bin/sh

tries=0
while [[ $tries -lt 5 ]]
do
    if /bin/ping -c 1 8.8.8.8 >/dev/null
    then
        echo "ping 8.8.8.8 OK"
        exit 0
    fi
    tries=$((tries+1))
done
echo "restart network"
/etc/init.d/network restart
