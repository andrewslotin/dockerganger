FROM golang:1.7-alpine
MAINTAINER Andrew Slotin <andrew.slotin@gmail.com>

RUN apk add --update git && rm -rf /var/cache/apk/*
RUN mkdir -p /opt/doppelganger

VOLUME ["/var/mirrors"]
EXPOSE 8081

ENV DOPPELGANGER_VERSION=head
ENV GOPATH=/opt
RUN go get -d github.com/andrewslotin/doppelganger

WORKDIR $GOPATH/src/github.com/andrewslotin/doppelganger
RUN REVISION=$(git rev-parse --short HEAD); \
    GOGC=off go build -ldflags "-X 'main.Version=$REVISION' -X 'main.BuildDate=$(date +%F)'" -o doppelganger; \
    sed -i"" "s~version := \".*\"~version := \"rev. $REVISION\"~" templates/layout.html.template

ENTRYPOINT ./doppelganger --mirror=/var/mirrors
