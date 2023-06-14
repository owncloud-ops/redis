FROM docker.io/redis:6.2.12-alpine@sha256:d89e8e274fd4138193c5e73359e49e340763de72bc567d2ca848a569a4b7a74c

LABEL maintainer="ownCloud GmbH"
LABEL org.opencontainers.image.authors="ownCloud GmbH"
LABEL org.opencontainers.image.title="Redis"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/redis"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/redis"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/redis"

ARG GOMPLATE_VERSION
ARG CONTAINER_LIBRARY_VERSION

# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.11.5}"
# renovate: datasource=github-releases depName=owncloud-ops/container-library
ENV CONTAINER_LIBRARY_VERSION="${CONTAINER_LIBRARY_VERSION:-v0.1.0}"

USER 0

ADD overlay/ /

RUN apk --update add --virtual .build-deps curl tar && \
    curl -SsfL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64" && \
    curl -SsfL "https://github.com/owncloud-ops/container-library/releases/download/${CONTAINER_LIBRARY_VERSION}/container-library.tar.gz" | tar xz -C / && \
    chmod 755 /usr/local/bin/gomplate && \
    mkdir -p /etc/redis && \
    mkdir -p /data && \
    chown -R redis:redis /etc/redis && \
    chown -R redis:redis /data && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

VOLUME /data

EXPOSE 6379

USER 999

ENTRYPOINT ["/usr/bin/entrypoint"]
HEALTHCHECK --interval=5s --timeout=3s --retries=10 CMD /usr/bin/healthcheck
WORKDIR /data
CMD []
