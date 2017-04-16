FROM ruby:2.4.0
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
WORKDIR /myapp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /rails_mysql
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME