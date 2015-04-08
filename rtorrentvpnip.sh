#!/usr/bin/env sh

tun_dev="tun1"
bind2ip=`ip route get 8.8.8.8 oif "$tun_dev" | awk '{if ($5 == "") next;} {print $5}'`

if [ -z "$bind2ip" ]; then 
   echo "Unable to bind, couldn't get piatunnel ip"
   exit -1
fi
echo "Starting rtorrent bind to ip: $bind2ip"
exec rtorrent -b "$bind2ip"
