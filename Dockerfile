FROM alpine:edge

MAINTAINER Ekozan

RUN apk-install ca-certificates ruby ruby-bundler  \
  && rm -fr /usr/share/ri \
  && rm -rf /var/cache/apk/*

COPY files /

CMD ["/bin/sh"]
