FROM ruby:2.2.0

ENV APP_HOME /myapp
ENV APP_USER rubyist

RUN apt-get update -qq && apt-get install -y build-essential

# for a JS runtime
RUN apt-get install -y nodejs

WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install -j4

RUN mkdir $APP_HOME
VOLUME $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000

# Create a user to run the app
RUN useradd --no-create-home $APP_USER -u 1000 -g sudo
RUN echo '$APP_USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Change container uid to match host uid and run rails server
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
