FROM ruby:3.0.0-alpine

RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn git

WORKDIR /app
COPY Gemfile* /app/

RUN gem install bundler
RUN bundle install
RUN bundle binstubs --all
RUN touch $HOME/.bashrc

RUN echo "alias ll='ls -alF'" >> $HOME/.bashrc
RUN echo "alias la='ls -A'" >> $HOME/.bashrc
RUN echo "alias l='ls -CF'" >> $HOME/.bashrc
RUN echo "alias q='exit'" >> $HOME/.bashrc
RUN echo "alias c='clear'" >> $HOME/.bashrc

CMD [ "/bin/bash" ]
ENTRYPOINT [ "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p 3000"]