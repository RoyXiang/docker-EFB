FROM alpine
MAINTAINER Roy Xiang <developer@royxiang.me>

ENV LANG C.UTF-8

ARG VERSION=1.6.3
ARG ITCHAT_TAG=v1.3.7-mod

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
                git \
                tar \
        && mkdir -p /opt/ehForwarderBot/storage \
        && cd /opt/ehForwarderBot \
        && curl -sSL https://github.com/blueset/ehForwarderBot/archive/v$VERSION.tar.gz | tar xz --strip 1 \
        && pip3 install -U setuptools pip pypng pyqrcode requests retrying \
        && pip3 install -e git+https://github.com/RoyXiang/ItChat.git@$ITCHAT_TAG#egg=itchat \
        && pip3 install -r /opt/ehForwarderBot/requirements.txt \
        && rm -rf /root/.cache \
        && apk del .fetch-deps

WORKDIR /opt/ehForwarderBot

CMD ["python3", "main.py"]
