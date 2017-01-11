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

# Capybara
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb


# nodejs
RUN apt-get install -y nodejs

# GIT
RUN apt-get install -y pg git
RUN mkdir -p /home/root/.ssh/

ENV APP_HOME /var/rails
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME



## Copy the Rails application into place
# COPY . .

## Define the script we want run once the container boots
## Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
# CMD [ "config/containers/app_cmd.sh" ]

