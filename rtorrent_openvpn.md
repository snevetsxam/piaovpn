## Intro
Set up a VPN (in this case [Private Internet Access](https://www.privateinternetaccess.com) and start & bind ``rtorrent`` on that tunnel
Inspired by: http://www.ichimonji10.name/blog/1/

Note that only ``rtorrent`` traffic will be routed through the tunnel, everything else goes the normal way. 

## Prerequisite 
Make sure that you have configured a routing table ``piatunnel`` on your system:
```sh
echo 200 piatunnel >> /etc/iproute2/rt_tables
```

Get the [PIA openvpn.zip](https://www.privateinternetaccess.com/openvpn/openvpn.zip), extract it and make sure that the certs etc. are in the same directory as ![pia_swe.ovpn](pia_swe.ovpn); same goes for ``vpn-up/down.sh``. Note that ![pia_swe.ovpn](pia_swe.ovpn) is derived from the sweden config file provided in that zip from pia.

### start it
establish the vpn
```sh
sudo openvpn swe_pia.ovpn
```
start ``rtorrent`` with the bind option
```sh
./rtorrentvpnip.sh
```

### ![rtorrentvpnip.sh](rtorrentvpnip.sh) 
Based on the configured tunnel, in example ``tun1``, get the local IP for the established VPN and start ``rtorrent`` with the ``-b`` (bind) parameter to bind to the local VPN IP.

## Read further
https://wiki.archlinux.org/index.php/RTorrent

## Todo
* The openvpn resets itself every now and then, in this case the IP which rtorrent has been bind to is not valid anymore. Either re-execute ![rtorrentvpnip.sh](rtorrentvpnip.sh) or implement a script that tells rtorrent to bind to another IP 
* update ![rtorrentvpnip.sh](rtorrentvpnip.sh) to figure out the openvpn tunnel itself 
* enable [PIA port-forwarding](https://www.privateinternetaccess.com/forum/discussion/180/port-forwarding-without-the-application-advanced-users) and configure rtorrent use the fwd'd-port 