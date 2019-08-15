FROM ruby:2.5.5
ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler

RUN mkdir /sagaku
WORKDIR /sagaku

ADD Gemfile /sagaku/Gemfile
ADD Gemfile.lock /sagaku/Gemfile.lock

RUN bundle install

ADD . /sagaku