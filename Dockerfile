FROM alpine

LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

ARG BOSH_VERSION="6.4.1"
ARG FLY_VERSION="6.7.5"
ARG OM_VERSION="7.2.0"
ARG BBR_VERSION="1.9.1"
ARG CREDHUB_VERSION="2.9.1-beta.9"

RUN apk upgrade \
    && apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    && rm -rf /var/cache/apk/* 

RUN curl -L "https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_VERSION}/bosh-cli-${BOSH_VERSION}-linux-amd64" -o /usr/local/bin/bosh \
    && chmod +x /usr/local/bin/bosh \
    && curl -L "https://github.com/concourse/concourse/releases/download/v${FLY_VERSION}/fly-${FLY_VERSION}-linux-amd64.tgz" -o /tmp/fly.tgz \
    && tar -xzf /tmp/fly.tgz -C /tmp \
    && chmod +x /tmp/fly \
    && mv /tmp/fly /usr/local/bin/ \
    && rm -f /tmp/fly.tgz \
    && curl -L "https://github.com/pivotal-cf/om/releases/download/${OM_VERSION}/om-linux-${OM_VERSION}.tar.gz" -o /tmp/om.tar.gz \
    && tar -xzf /tmp/om.tar.gz -C /tmp \
    && mv /tmp/om /usr/local/bin/ \
    && rm -f /tmp/om.tar.gz \
    && curl -L "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v${BBR_VERSION}/bbr-${BBR_VERSION}-linux-amd64" -o /usr/local/bin/bbr \
    && chmod +x /usr/local/bin/bbr \
    && curl -L "https://storage.googleapis.com/credhub-cli-tarballs/credhub-linux-${CREDHUB_VERSION}.tgz" -o /tmp/credhub.tgz \
    && tar -xzf /tmp/credhub.tgz -C /tmp \
    && chmod +x /tmp/credhub \
    && mv /tmp/credhub /usr/local/bin/ \
    && rm -rf /tmp/credhub.tgz
