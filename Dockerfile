FROM alpine:edge
MAINTAINER Roy Xiang <developer@royxiang.me>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                py3-certifi \
                py3-numpy \
                py3-pillow \
                py3-requests \
        && ln -sf "$(python3 -c 'import requests; print(requests.__path__[0])')/cacert.pem" \
                  "$(python3 -c 'import certifi; print(certifi.__path__[0])')/cacert.pem"

RUN set -ex \
        && apk add --update --no-cache --virtual .fetch-deps curl \
        && curl -L -o /tmp/requirements.txt \
                https://raw.githubusercontent.com/blueset/ehForwarderBot/dev/requirements.txt \
        && pip3 install -r /tmp/requirements.txt \
        && rm -rf /root/.cache /tmp/*
