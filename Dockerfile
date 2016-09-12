FROM rails:4.2.5.1
MAINTAINER janderbacalso@gmail.com

# Cache
WORKDIR /tmp
Add Gemfile Gemfile
Add Gemfile.lock Gemfile.lock
RUN bundle install

# Mount our app
RUN mkdir /app
ADD . /app
WORKDIR /app

# expose port
EXPOSE 3000

# set ENV
ENV DB_HOST ${DB_HOST:-db}
ENV RAIL_ENV ${RAIL_ENV:-development}
ENV DATABASE_URL ${DATABASE_URL:-db}

# Entry Point
ENTRYPOINT bundle exec rake db:create db:migrate

CMD ["bundle", "exec", "unicorn", "-p", "0.0.0.0"]
