#!/bin/sh

docker run -it --rm --name bind-dev \
-v conf/named.conf:/etc/bind/named.conf \
-v conf/example.net.zone:/var/bind/example.net.zone \
-p 5300:53 \
-p 5300:53/udp \
decaby7e/bind

exit 0

