FROM alpine:3.3
MAINTAINER Andrew Slotin <andrew.slotin@gmail.com>

ENV DOPPELGANGER_VERSION=1.0.4

RUN apk add --update git && rm -rf /var/cache/apk/*
RUN mkdir -p /opt/doppelganger

VOLUME ["/var/mirrors"]
EXPOSE 8081

WORKDIR /opt/doppelganger

ADD https://github.com/andrewslotin/doppelganger/releases/download/v${DOPPELGANGER_VERSION}/doppelganger-${DOPPELGANGER_VERSION}_linux_amd64.tar.gz /tmp/doppelganger.tar.gz
RUN tar xzkf /tmp/doppelganger.tar.gz -C /opt/doppelganger &&\
    rm -rf /tmp/doppelganger.tar.gz

ENTRYPOINT /opt/doppelganger/doppelganger --mirror=/var/mirrors