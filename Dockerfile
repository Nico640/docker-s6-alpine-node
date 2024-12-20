FROM node:16.20.0-alpine3.17 AS base
ARG TARGETARCH
ARG TARGETVARIANT

FROM base AS base-amd64
ENV S6_OVERLAY_ARCH=x86_64 S6_KEEP_ENV=1
ENV APK_ARCH=x86_64

FROM base AS base-arm64
ENV S6_OVERLAY_ARCH=aarch64
ENV APK_ARCH=aarch64

FROM base AS base-armv7
ENV S6_OVERLAY_ARCH=armhf
ENV APK_ARCH=armhf

FROM base-${TARGETARCH}${TARGETVARIANT}

RUN set -x && apk add --no-cache curl tzdata logrotate shadow coreutils libstdc++ \
    && curl -SL "https://github.com/just-containers/s6-overlay/releases/download/v3.2.0.2/s6-overlay-noarch.tar.xz" | tar xvJ -C / \
    && curl -SL "https://github.com/just-containers/s6-overlay/releases/download/v3.2.0.2/s6-overlay-${S6_OVERLAY_ARCH}.tar.xz" | tar xvJ -C / \
    && mkdir -p /config \
    && sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf \
    && rm -rf /var/cache/apk/*

COPY rootfs /

ENTRYPOINT [ "/init" ]