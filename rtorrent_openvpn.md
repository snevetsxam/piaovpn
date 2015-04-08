## Intro
Set up an openvpn VPN to (in this case pia) and start & bind ``rtorrent`` on that tunnel

Inspired by: http://www.ichimonji10.name/blog/1/

### [rtorrentvpnip.sh] 
Based on the configured tunnel, in example ``tun1``, get the local IP for the established VPN and start ``rtorrent`` with the ``-b`` (bind) parameter to bind to the local VPN IP.

## Perquisite 
Make sure that you have configured a routing table ``piatunnel`` on your system:
```sh
> echo 200 piatunnel >> /etc/iproute2/rt_tables
```

## Read further
https://wiki.archlinux.org/index.php/RTorrent