FROM ruby:2.1.10

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

RUN apt-get update && apt-get install -y \
  nodejs

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# This is added via https://devcenter.heroku.com/articles/exec#using-with-docker
COPY ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# $PORT is assigned from Heroku at deploy time
CMD rails s -p $PORT
