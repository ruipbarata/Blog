FROM ruby:2.6.6-alpine3.10

ENV RAILS_APP_PATH /project
ENV PATH "${PATH}:${RAILS_APP_PATH}/bin"
 
ENV RAILS_ENV production
ENV RACK_ENV production
ENV NODE_ENV production
 
ENV PORT 3000

RUN mkdir $RAILS_APP_PATH
WORKDIR $RAILS_APP_PATH

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories \
 && apk --update --no-cache add make g++ postgresql-dev imagemagick=6.9.6.8-r1 imagemagick-dev=6.9.6.8-r1 nodejs npm yarn bash libgcc libstdc++ libx11 glib libxrender libxext libintl ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family \
 && gem install bundler

COPY Gemfile $RAILS_APP_PATH
COPY Gemfile.lock $RAILS_APP_PATH
RUN bundle config set no-cache 'true' && bundle install --without development test && cp Gemfile.lock /tmp

COPY package.json $RAILS_APP_PATH
COPY yarn.lock $RAILS_APP_PATH
RUN yarn install --check-files && cp yarn.lock /tmp

COPY . $RAILS_APP_PATH

RUN RAILS_ENV=production bin/rails assets:precompile
RUN RAILS_ENV=production RACK_ENV=production NODE_ENV=production bin/rails webpacker:compile

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE $PORT