# Dockerfile

FROM alpine:3

RUN mkdir -p /watch_folder

RUN mkdir -p /complete

RUN mkdir -p /incomplete

RUN mkdir -p /config

RUN apk --no-cache add transmission-daemon

RUN rm -rf /tmp/*

ENTRYPOINT exec usr/bin/transmission-daemon \
    --foreground \
    --allowed ${NETWORK_RANGE} \
    --config-dir /config \
    --download-dir /complete \
    --incomplete-dir /incomplete \
    -c /watch_folder \
    --encryption-preferred \
    --no-global-seedratio \
    --port ${PORT} \
    --peerport ${PEERPORT} \
    --no-portmap \
    --auth \
    --username ${USERNAME} \
    --password ${PASSWORD} \
    --log-info \
    --pid-file /config/transmission.pid
