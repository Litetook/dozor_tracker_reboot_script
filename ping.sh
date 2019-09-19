#!/bin/bash

TIME=`date +%T`
PING=`ping 8.8.8.8 -c5 | grep 'icmp_seq=1'`
echo "[$TIME] $PING" >>/root/script/pingtime.log
tail -n 1 /root/script/pingtime.log

