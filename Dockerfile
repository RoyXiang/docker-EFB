FROM ubuntu:xenial
MAINTAINER Roy Xiang <developer@royxiang.me>

RUN apt-get update -y \
    && apt-get install -y curl python3 python3-pip ffmpeg \
    && curl -L -o /tmp/EFB-dev.tar.gz https://github.com/blueset/ehForwarderBot/archive/dev.tar.gz \
    && mkdir /opt/ehForwarderBot \
    && tar xzf /tmp/EFB-dev.tar.gz --strip-components=1 -C /opt/ehForwarderBot \
    && mkdir /opt/ehForwarderBot/storage \
    && pip3 install -r /opt/ehForwarderBot/requirements.txt \
    && apt-get autoremove -y curl python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/*

WORKDIR /opt/ehForwarderBot

CMD ["python3", "main.py"]
