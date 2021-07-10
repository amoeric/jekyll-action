FROM ruby:2.7-alpine

LABEL version="2.0.1"
LABEL repository="https://github.com/amoeric/jekyll-action"
LABEL homepage="https://github.com/amoeric/jekyll-action"
LABEL maintainer="Amoeric <amoeric@github.com>"

RUN apk add --update nodejs npm

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
