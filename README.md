[![Docker Build Status](https://img.shields.io/docker/build/oznu/s6-node.svg?label=x64%20build&style=for-the-badge)](https://hub.docker.com/r/oznu/s6-node/) [![Travis](https://img.shields.io/travis/oznu/docker-s6-alpine-node.svg?label=arm%20build&style=for-the-badge)](https://travis-ci.org/oznu/docker-s6-alpine-node)

# s6-node
This is a fork of [oznu/docker-s6-alpine-node](https://github.com/oznu/docker-s6-alpine-node) meant for maintaining [nico640/docker-unms](https://github.com/Nico640/docker-unms).

This is a base Node.js image with the S6 Overlay and support for x86_64 and ARM (Raspberry Pi 1, 2, 3).

Debian Linux + [S6 Overlay](https://github.com/just-containers/s6-overlay) + [Node](https://nodejs.org/en/)

## Usage

See the [S6 Overlay Documentation](https://github.com/just-containers/s6-overlay) for details on how to manage services.

x86_64:

```shell
docker run nico640/s6-debian-node:amd64
docker run nico640/s6-debian-node:debian-amd64
```

ARM:

```shell
docker run nico640/s6-debian-node:armhf
docker run nico640/s6-debian-node:debian-armhf
```