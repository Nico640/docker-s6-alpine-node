[![Docker Build Status](https://img.shields.io/docker/cloud/build/nico640/s6-debian-node.svg?label=x64%20build&style=for-the-badge)](https://hub.docker.com/r/nico640/s6-debian-node/) [![GitLab](https://img.shields.io/gitlab/pipeline/Nico640/docker-s6-debian-node.svg?label=arm%20build&style=for-the-badge)](https://gitlab.com/Nico640/docker-s6-debian-node/-/jobs)

# s6-node
This is a fork of [oznu/docker-s6-alpine-node](https://github.com/oznu/docker-s6-alpine-node) meant for maintaining [nico640/docker-unms](https://github.com/Nico640/docker-unms).

This is a base Node.js image with the S6 Overlay and support for x86_64 and ARM (Raspberry Pi 1, 2, 3).

Debian Linux + [S6 Overlay](https://github.com/just-containers/s6-overlay) + [Node](https://nodejs.org/en/)

## Usage

See the [S6 Overlay Documentation](https://github.com/just-containers/s6-overlay) for details on how to manage services.

x86_64:

```shell
docker run nico640/s6-debian-node:latest
```

ARM:

```shell
docker run nico640/s6-debian-node:armhf
```