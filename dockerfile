FROM alpine:latest

RUN apk update
RUN apk add --no-cache bash wget git sed jq

COPY entrypoint.sh /usr/bin/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
