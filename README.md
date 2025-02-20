[![Build](https://github.com/ianhaddock/transmission-container/actions/workflows/build.yml/badge.svg)](https://github.com/ianhaddock/transmission-container/actions/workflows/build.yml)

# Transmission Container

Simplified [Transmission BT][1] container with opinonated defaults. Built as I was tired of dealing the added features of some popular containers.

## Dockerfile

Check the Dockerfile if items in your settings.json are being overwritten.

## Usage

```
docker run \
  -d \
  --name transmission-container \
  -e NETWORK_RANGE=10.*
  -e USERNAME=test
  -e PASSWORD=test
  -e PORT=9091
  -e PEERPORT=51413
  -v ./config:/config
  -v ./complete:/complete
  -v ./incomplete:/incomplete
  -v ./watch_folder:/watch_folder
  ghcr.io/ianhaddock/transmission-container:latest
```

[1]: https://transmissionbt.com/
