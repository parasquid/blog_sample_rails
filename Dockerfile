FROM ruby

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends apt-utils apt-transport-https

RUN apt-get install -y netselect-apt && netselect-apt -c Japan
RUN cat sources.list
RUN mv sources.list /etc/apt/sources.list
RUN apt-get update

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

# prep our user
RUN mkdir /home/user
RUN useradd user

RUN mkdir $BUNDLE_PATH
RUN chown user: /bundle -R
RUN chown user: /myapp -R
RUN chown user: /home/user -R

RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
USER user
