FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
  build-essential \
  wamerican \
  gcc \
  g++ \
  make \
  libfreeimage-dev \
  nodejs \
  yarn

RUN mkdir -p /app
WORKDIR /app

ENV RAILS_ENV production
ENV RACK_ENV production
ENV DATABASE_URL postgres://USER:PASSWORD@localhost/smart_aleck_production
ENV SECRET_KEY_BASE omgsupersecret

COPY . ./
RUN gem install bundler --version '= 1.16.6' && bundle install && bundle exec rake assets:precompile

EXPOSE 8080

CMD ["bundle", "exec", "unicorn"]
