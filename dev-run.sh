#!/bin/sh

# -p 5300:53 \
# -p 5300:53/udp \
docker run -it --rm --name bind-dev \
--network host \
-v $PWD/volume/conf:/conf \
-v $PWD/volume/zones:/zones \
ranvier/bind $@




exit 0

