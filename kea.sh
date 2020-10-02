#!/bin/bash

# turn on bash's job control
set -m

# As of KEA 1.7.x it needs this directory to run
mkdir /run/kea

if [ "$DHCP4_SERVER" = "true" ]
then
  /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf &
fi

if [ "$DHCP6_SERVER" = "true" ]
then
  /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf &
fi

# now we bring the primary process back into the foreground
# and leave it there
fg %1
