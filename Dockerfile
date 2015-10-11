FROM alpine:3.2

MAINTAINER Ekozan

RUN apk --update add ca-certificates ruby ruby-bundler  \
  && rm -fr /usr/share/ri \
  && rm -rf /var/cache/apk/*

COPY files /

CMD ["/bin/sh"]
