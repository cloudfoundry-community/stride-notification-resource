FROM alpine:3.7

RUN apk add --no-cache bash \
  && apk add --no-cache curl \
  && apk add --no-cache jq

COPY assets/* /opt/resource/*

RUN chmod +x opt/resource/check \
  opt/resource/in \
  opt/resource/out