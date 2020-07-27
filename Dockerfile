FROM debian:9.13-slim AS base
ARG TARGETARCH
ARG TARGETVARIANT

FROM base AS base-amd64
ENV S6_OVERLAY_ARCH=amd64
ENV NODE_ARCH=x64

FROM base AS base-arm64
ENV S6_OVERLAY_ARCH=aarch64
ENV NODE_ARCH=arm64

FROM base AS base-armv7
ENV S6_OVERLAY_ARCH=armhf
ENV NODE_ARCH=armv7l

FROM base-${TARGETARCH}${TARGETVARIANT}

RUN set -x && apt-get update \
  && apt-get install -y curl tzdata locales psmisc procps iputils-ping logrotate \
  && locale-gen en_US.UTF-8 \
  && curl -SLO "https://github.com/just-containers/s6-overlay/releases/download/v1.21.1.1/s6-overlay-${S6_OVERLAY_ARCH}.tar.gz" \
  && tar -xzf s6-overlay-${S6_OVERLAY_ARCH}.tar.gz -C / \
  && tar -xzf s6-overlay-${S6_OVERLAY_ARCH}.tar.gz -C /usr ./bin \
  && rm -rf s6-overlay-${S6_OVERLAY_ARCH}.tar.gz \
  && useradd -u 911 -U -d /config -s /bin/false abc \
  && usermod -G users abc \
  && mkdir -p /app /config /defaults \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* \
  && rm -rf /etc/cron.daily/apt-compat /etc/cron.daily/dpkg /etc/cron.daily/passwd /etc/cron.daily/exim4-base \
  && sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

ENV NODE_VERSION 10.19.0

RUN set -x \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-${NODE_ARCH}.tar.gz" \
  && tar -xzf "node-v$NODE_VERSION-linux-${NODE_ARCH}.tar.gz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-${NODE_ARCH}.tar.gz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && npm set prefix /usr/local \
  && npm config set unsafe-perm true

ENV YARN_VERSION 1.21.1

RUN set -ex \
  && curl -fSLO "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && mkdir -p /opt/yarn \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz

COPY rootfs /

ENTRYPOINT [ "/init" ]
