FROM alpine:3.10.3

RUN apk add --update curl && rm -rf /var/cache/apk/*

WORKDIR /influxdb/setup

COPY wait-for.sh .

RUN chmod +x wait-for.sh

COPY setup.sh .

CMD ["sh", "setup.sh"]