FROM node:5.7

RUN apt-get update \
    && apt-get install --no-install-recommends git ca-certificates \
    && git clone https://github.com/etsy/statsd.git /src \
    && apt-get autoremove --purge --yes git ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8125

RUN mkdir /data
ADD statsd /statsd

ENV ["GRAPHITE_PORT", "GRAPHITE_HOST"]

CMD ["/statsd"]
