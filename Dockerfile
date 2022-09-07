FROM alpine:latest

MAINTAINER github.com/shourai
LABEL Description="kea-dhcp Docker image based on Alpine Linux."

ENV DHCP4_SERVER=true
ENV DHCP6_SERVER=false

RUN apk --no-cache add kea bash tzdata

COPY kea.sh /etc/kea/

EXPOSE 67 68

CMD ["/bin/bash", "/etc/kea/kea.sh"]
