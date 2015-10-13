FROM alpine:3.2

MAINTAINER Ekozan

ENV RUBY_VERSION 2.2.3
ENV BUNDLER_VERSION 1.10.5

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME
RUN echo "http://dl-1.alpinelinux.org/alpine/v3.2/main" >> /etc/apk/repositories \
  && echo "@testing http://dl-1.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --update add ca-certificates "ruby-dev<$RUBY_VERSION" \
  && rm -fr /usr/share/ri \
  && rm -rf /var/cache/apk/*

RUN gem install bundler --no-rdoc --no-ri --version "$BUNDLER_VERSION" \
	&& bundle config --global path "$GEM_HOME" \
	&& bundle config --global bin "$GEM_HOME/bin"

COPY files /

CMD ["irb"]
