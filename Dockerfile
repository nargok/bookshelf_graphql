FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /bookshelf
WORKDIR /bookshelf
COPY Gemfile /bookshelf/Gemfile
COPY Gemfile.lock /bookshelf/Gemfile.lock
RUN bundle install
COPY . /bookshelf