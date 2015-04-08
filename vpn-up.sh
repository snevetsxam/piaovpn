#!/usr/bin/env sh
# Configure routing tables to implement split routing based on source IP.
# This script should be called by the `--up` option.

rt_table="piatunnel"

# make sure that rt table exits, e.g.
# echo 200 piatunnel >> /etc/iproute2/rt_tables

ip rule add from "$ifconfig_local" table "$rt_table"
ip route add table "$rt_table" default via "$ifconfig_remote"
ip route add table "$rt_table" "$ifconfig_remote" via "$ifconfig_local" dev "$dev"