FROM alpine:3

# Metadata
LABEL maintainer="decaby7e@ranvier.net"
EXPOSE 53/tcp
EXPOSE 53/udp

# Install bind9
RUN apk add bind bash

# Install dumb-init
# https://github.com/Yelp/dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 &&\
    chmod +x /usr/local/bin/dumb-init

# Copy in resources
COPY resources /app/

# Runs "/usr/bin/dumb-init -- /app/entrypoint.sh [ARGS]"
ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "/app/entrypoint.sh"]
#CMD ["/app/entrypoint.sh"]
