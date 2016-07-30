FROM ruby:2.3.0

COPY scripts/setup /scripts/setup
RUN /scripts/setup

RUN mkdir /app
WORKDIR /app

COPY scripts/run /scripts/run
ENTRYPOINT ["/scripts/run"]
