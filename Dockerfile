FROM ruby:3.2.0

RUN apt-get update -qq \
&& apt-get install -y nodejs npm \
&& rm -rf /var/lib/apt/lists/* \
&& npm install -g yarn

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install \
&& rails webpacker:install
