#!/bin/bash
set -e
postconf -e "smtp_sasl_password_maps = static:$smtp_sasl_password_maps"
postconf -e "myhostname = $myhostname"
postconf -e "myorigin = $myorigin"
postconf -e "mynetworks = $mynetworks"
postconf -e "relayhost = $relayhost"
postconf -e "debug_peer_list = $debug_peer_list"
/usr/sbin/postfix start-fg
exec "$@"
