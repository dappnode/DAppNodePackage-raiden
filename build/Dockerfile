FROM python:3.6-alpine

ENV LANG en_US.UTF-8

RUN apk update && apk add --no-cache wget jq gettext

ARG RAIDEN_VERSION
RUN echo "Downloading Raiden version: $RAIDEN_VERSION"
RUN wget https://github.com/raiden-network/raiden/releases/download/v${RAIDEN_VERSION}/raiden-v${RAIDEN_VERSION}-linux-x86_64.tar.gz \
    -qO- | tar -C /usr/bin -xzvf -
RUN mv /usr/bin/raiden-v${RAIDEN_VERSION}-linux-x86_64 /usr/bin/raiden

ARG ALPINE_GLIBC_PACKAGE_VERSION="2.31-r0"
RUN ALPINE_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" && \
    ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    wget \
    "https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub" \
    -O "/etc/apk/keys/sgerrand.rsa.pub" && \
    wget \
    "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" && \
    apk add --no-cache \
    "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" && \
    \
    rm "/etc/apk/keys/sgerrand.rsa.pub" && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true && \
    echo "export LANG=$LANG" > /etc/profile.d/locale.sh && \
    \
    apk del glibc-i18n && \
    \
    rm "/root/.wget-hsts" && \
    apk del .build-dependencies && \
    rm \
    "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
    "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME"

RUN mkdir -p /home/.raiden
WORKDIR /root/.raiden

RUN apk add --no-cache build-base python2-dev  \
    && pip install pysha3 \
    && apk del build-base python2-dev

COPY init.sh /usr/bin
COPY eip55-checksum /usr/bin
COPY config.toml.template .

CMD ["init.sh"]
