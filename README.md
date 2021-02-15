# kea-dhcp

A Docker container based on alpine which implements kea-dhcp v4 and v6.

This image can be downloaded from dockerhub
```
docker pull shourai/kea-dhcp-alpine
```

## Environment variables

The defaults are:
```
ENV DHCP4_SERVER=true
ENV DHCP6_SERVER=false
```

When building the image yourself, change the environment variables as desired.
Else you can set the environment variable when starting the container.

## Examples

### Running both dhcp4 and dhcp6 server

Mount the `kea-dhcp4.conf` and `kea-dhcp6.conf` files into `/etc/kea`
```
docker run --rm -d \
--net host \
-v $(pwd)/kea-dhcp4.conf:/etc/kea/kea-dhcp4.conf \
-v $(pwd)/kea-dhcp6.conf:/etc/kea/kea-dhcp6.conf \
-e DHCP4_SERVER=true -e DHCP6_SERVER=false \
-p 67:67 -p 68:68 \
--name kea-dhcp shourai/kea-dhcp-alpine
```
