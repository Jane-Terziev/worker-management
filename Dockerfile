FROM ruby:3.1.2-alpine3.15

ENV BUNDLER_VERSION=2.3.10

RUN apk update && apk upgrade && apk add --no-cache \
    build-base \
    nodejs \
    libpq-dev \
    postgresql-client \
    tzdata \
    gcompat \
    && rm -rf /var/cache/apk/*

RUN mkdir /worker-management
WORKDIR /worker-management

COPY Gemfile Gemfile.lock ./

RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install

COPY . .