FROM ubuntu:xenial
MAINTAINER Roy Xiang <developer@royxiang.me>

RUN apt-get update -y \
    && apt-get install -y curl python3 python3-pip ffmpeg \
    && curl -L -o /tmp/requirements.txt \
        https://raw.githubusercontent.com/blueset/ehForwarderBot/dev/requirements.txt \
    && pip3 install -r /tmp/requirements.txt \
    && apt-get autoremove -y curl python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/*
