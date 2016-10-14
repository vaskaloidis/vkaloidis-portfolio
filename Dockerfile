# Dockerfile

# TODO: Finish dockerize app, next is dockerize DB
# http://chrisstump.online/2016/02/20/docker-existing-rails-application/

# Base our image on an official, minimal image of our preferred Ruby
FROM ruby:2.2.3-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential

# postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# nodejs
RUN apt-get install -y nodejs

# mysql2 for some fucking reason??
RUN apt-get install -qq -y libmysqlclient-dev
RUN gem install mysql2

ENV APP_HOME /rails-apps/vkaloidis
RUN mkdir -p /rails-apps/vkaloidis
WORKDIR /rails-apps/vkaloidis

# Gemfiles
ADD Gemfile* /rails-apps/vkaloidis/

# Finish establishing our Ruby enviornment
RUN bundle install

ADD . /rails-apps/vkaloidis

## Copy the Rails application into place
# COPY . .

## Define the script we want run once the container boots
## Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
# CMD [ "config/containers/app_cmd.sh" ]

