[![GitHub Release](https://img.shields.io/github/v/release/Nico640/docker-s6-alpine-node?style=flat-square)](https://github.com/nico640/docker-s6-alpine-node/releases) 
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Nico640/docker-s6-alpine-node/Docker%20CI%20Release?style=flat-square)](https://github.com/Nico640/docker-s6-alpine-node/actions?query=workflow%3A%22Docker+CI+Release%22)

# s6-alpine-node
This is a fork of [oznu/docker-s6-alpine-node](https://github.com/oznu/docker-s6-alpine-node) meant for maintaining [nico640/docker-unms](https://github.com/Nico640/docker-unms).

This is a base Node.js image with the S6 Overlay and support for x86_64 and ARM (Raspberry Pi 1, 2, 3, 4).

Debian Linux + [S6 Overlay](https://github.com/just-containers/s6-overlay) + [Node](https://nodejs.org/en/)

## Usage

See the [S6 Overlay Documentation](https://github.com/just-containers/s6-overlay) for details on how to manage services.

```shell
docker run nico640/s6-alpine-node:latest
```
