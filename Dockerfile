FROM alpine
MAINTAINER Roy Xiang <developer@royxiang.me>

ENV LANG C.UTF-8

ARG URL=https://raw.githubusercontent.com/blueset/ehForwarderBot/dev/requirements.txt

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                py3-numpy \
                py3-pillow

RUN set -ex \
        && apk add --update --no-cache --virtual .fetch-deps curl \
        && curl -L -o /tmp/requirements.txt $URL \
        && pip3 install -r /tmp/requirements.txt \
        && rm -rf /root/.cache /tmp/* \
        && apk del .fetch-deps
