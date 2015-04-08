#!/usr/bin/env sh
# Tear down rules which implement split routing based on source IP. This
# script should be called by the `--down` option.

rt_table="piatunnel"

# make sure that rt table exits, e.g.
# echo 200 piatunnel >> /etc/iproute2/rt_tables

ip rule delete from "$ifconfig_local" table "$rt_table"
ip route flush table "$rt_table"
