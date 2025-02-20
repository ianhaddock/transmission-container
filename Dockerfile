# Dockerfile

FROM alpine:3

RUN mkdir -p /watch_folder

RUN mkdir -p /complete

RUN mkdir -p /incomplete

RUN mkdir -p /config

RUN apk --no-cache add transmission-daemon

RUN rm -rf /tmp/*

LABEL org.opencontainers.image.source="https://github.com/ianhaddock/transmission-container"

LABEL org.opencontainers.image.description="Simple TransmissionBT Container."

LABEL org.opencontainers.image.licenses=MIT

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
