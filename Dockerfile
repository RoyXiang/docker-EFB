FROM alpine
MAINTAINER Roy Xiang <developer@royxiang.me>

ENV LANG C.UTF-8

ARG VERSION=1.6.4

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                py3-numpy \
                py3-pillow

RUN set -ex \
        && apk add --update --no-cache --virtual .fetch-deps \
                curl \
                tar \
        && mkdir -p /opt/ehForwarderBot/storage \
        && cd /opt/ehForwarderBot \
        && curl -sSL https://github.com/blueset/ehForwarderBot/archive/v$VERSION.tar.gz | tar xz --strip 1 \
        && apk del .fetch-deps \
        && pip3 install -r /opt/ehForwarderBot/requirements.txt \
        && rm -rf /root/.cache

WORKDIR /opt/ehForwarderBot

CMD ["python3", "main.py"]
