#!/bin/sh

tries=0
while [[ $tries -lt 5 ]]
do
    if /bin/ping -c 1 8.8.8.8 >/dev/null
    then
        logger "WAN_WATCHDOG ping 8.8.8.8 OK"
        exit 0
    fi
    if /bin/ping -c 1 1.1.1.1 >/dev/null
    then
        logger "WAN_WATCHDOG ping 1.1.1.1 OK"
        exit 0
    fi
    tries=$((tries+1))
done
logger "WAN_WATCHDOG restart network  !!!"
/etc/init.d/network restart
