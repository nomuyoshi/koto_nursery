FROM ruby:2.7.4-alpine
RUN apk update \
      && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --jobs=2
COPY . /app
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
