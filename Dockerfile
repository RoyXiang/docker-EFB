FROM ubuntu:xenial
MAINTAINER Roy Xiang <developer@royxiang.me>

RUN apt-get update -y \
    && apt-get install -y curl python3 python3-pip ffmpeg \
    && curl -L -o /tmp/EFB-latest.tar.gz \
        $(curl -s https://api.github.com/repos/blueset/ehForwarderBot/tags \
            | grep tarball_url | head -n 1 | cut -d '"' -f 4) \
    && mkdir /opt/ehForwarderBot \
    && tar xzf /tmp/EFB-latest.tar.gz --strip-components=1 -C /opt/ehForwarderBot \
    && mkdir /opt/ehForwarderBot/storage \
    && pip3 install -r /opt/ehForwarderBot/requirements.txt \
    && apt-get autoremove -y curl python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/*

WORKDIR /opt/ehForwarderBot

CMD ["python3", "main.py"]
