FROM alpine:3.2

MAINTAINER Ekozan

ENV RUBY_VERSION=2.2.3

RUN apk --update add ca-certificates ruby=2.2.3-r0 ruby-bundler=1.10.5-r0 \
  && rm -fr /usr/share/ri \
  && rm -rf /var/cache/apk/*

COPY files /

CMD ["/bin/sh"]
