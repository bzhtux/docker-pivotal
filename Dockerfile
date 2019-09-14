FROM alpine

LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

ARG BOSH_VERSION="6.0.0"
ARG FLY_VERSION="5.4.1"
ARG UAA_VERSION="0.7.0"
ARG CREDHUB_VERSION="2.5.2"
ARG OM_VERSION="3.2.1"

RUN apk upgrade \
    && apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    make \
    openssh-client \
    && rm -rf /var/cache/apk/* 

RUN curl -L "https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_VERSION}/bosh-cli-${BOSH_VERSION}-linux-amd64" -o /tmp/bosh \
    && chmod +x /tmp/bosh \
    && mv /tmp/bosh /usr/local/bin/ \
    && curl -L "https://github.com/concourse/concourse/releases/download/v${FLY_VERSION}/fly-${FLY_VERSION}-linux-amd64.tgz" -o /tmp/fly.tgz \
    && tar -xzf /tmp/fly.tgz -C /tmp \
    && chmod +x /tmp/fly \
    && mv /tmp/fly /usr/local/bin/ \
    && rm -f /tmp/fly.tgz \
    && curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" -o /tmp/cf.tgz \
    && tar -xzf /tmp/cf.tgz -C /tmp \
    && chmod +x /tmp/cf \
    && mv /tmp/cf /usr/local/bin/ \
    && rm -f /tmp/cf.tgz \
    && curl -L "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/${UAA_VERSION}/uaa-linux-amd64-${UAA_VERSION}" -o /usr/local/bin/uaa \
    && chmod +x /usr/local/bin/uaa \
    && curl -L "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_VERSION}/credhub-linux-${CREDHUB_VERSION}.tgz" -o /tmp/credhub.tgz \
    && tar -xzf /tmp/credhub.tgz -C /tmp \
    && chmod +x /tmp/credhub \
    && mv /tmp/credhub /usr/local/bin/ \
    && rm -f /tmp/credhub.tgz \
    && curl -L "https://github.com/pivotal-cf/om/releases/download/${OM_VERSION}/om-linux-${OM_VERSION}.tar.gz" -o /tmp/om.tar.gz \
    && tar -xzf /tmp/om.tar.gz -C /tmp \
    && mv /tmp/om /usr/local/bin \
    && rm -f /tmp/om.tar.gz \
    && ls -l /tmp/
