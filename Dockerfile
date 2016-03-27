FROM alpine:latest

MAINTAINER Rajat Vig <rajat.vig@gmail.com>

EXPOSE 4567

ENV DATADIR /var/lib/kinesalite

RUN \
  mkdir $DATADIR && \
  apk add --no-cache python make g++ nodejs && \
  npm install -g kinesalite && \
  apk del python make g++ && \
  rm -rf /tmp/* /var/cache/apk/*

WORKDIR $DATADIR

VOLUME $DATADIR

ENTRYPOINT ["kinesalite", "--path", "/var/lib/kinesalite"]
