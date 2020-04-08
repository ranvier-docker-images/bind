FROM alpine:3

# Install dependencies
RUN apk add bind

# Run bind server and output log to console
ENTRYPOINT named -g

