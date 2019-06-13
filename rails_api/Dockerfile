FROM ruby:2.6.3

ENV WEBAPP /usr/src/app
RUN mkdir -p ${WEBAPP}
WORKDIR ${WEBAPP}


RUN apt-get update && apt-get install -y postgresql postgresql-contrib

# Run Bundle in a cache efficient way
RUN gem install bundler
COPY ./Gemfile* ./
RUN bundle install -j 7


# Add the rails app
ADD ./ ${WEBAPP}

EXPOSE 80

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
