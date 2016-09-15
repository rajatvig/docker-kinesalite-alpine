FROM mhart/alpine-node:5.11

MAINTAINER Rajat Vig <rajat.vig@gmail.com>

ARG VCS_REF
ARG IMAGE_VERSION

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rajatvig/docker-kinesalite-alpine" \
      org.label-schema.name="kinesalite-alpine" \
      org.label-schema.description="Run Kinesalite on Alpine Linux" \
      org.label-schema.version=$IMAGE_VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -d -t -p 4567:4567 rajatvig/kinesalite-alpine:latest"

EXPOSE 4567

ENV DATADIR /var/lib/kinesalite

RUN \
  mkdir -p $DATADIR && \
  apk add --no-cache python make g++ && \
  npm install -g kinesalite && \
  apk del python make g++ && \
  rm -rf /tmp/* /var/cache/apk/*

WORKDIR /var/lib/kinesalite

VOLUME $DATADIR

COPY cmd.sh /var/lib/kinesalite/cmd.sh

CMD ["./cmd.sh"]
