FROM ruby:2.2.4

RUN apt-get update && apt-get install -y \
postgresql-client \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ARG UID=1000
ARG GID=1000

RUN addgroup -gid ${GID} medusa && useradd -m --home-dir /machine_time --shell /bin/sh --gid ${GID} --uid ${UID} medusa \
 && mkdir -p /machine_time/public/system /machine_time/public/assets \
 && chown -R medusa:medusa /machine_time/public

WORKDIR /machine_time
COPY Gemfile Gemfile.lock /machine_time/
RUN bash -l -c 'bundle install'
#COPY package.json yarn.lock /machine_time/
#RUN bash -l -c 'yarn install'
COPY . /machine_time
RUN chown -R medusa:medusa /machine_time
USER medusa
ENV PORT 3000
EXPOSE $PORT
CMD ["sh", "-c", "bundle exec rails server -p ${PORT}"]