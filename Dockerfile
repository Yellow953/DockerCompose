FROM ruby:3.0.0-alpine

RUN apk add --update build-base postgresql-dev tzdata postgresql-client git

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000 
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]