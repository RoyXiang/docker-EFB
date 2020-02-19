FROM alpine:edge
MAINTAINER Scavin <scavin@appinn.com>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                libwebp \
                python3 \
                tiff \
                freetype \
                lcms2 \
                openjpeg \
                py3-olefile \
                openblas \
                py3-numpy \
                py3-pillow \
                py3-yaml \
                py3-cryptography \
                py3-decorator \
                jpeg-dev \
                zlib-dev

RUN set -ex \
        && pip3 install --upgrade pip \
        && pip3 install ehforwarderbot \
        && pip3 install efb-telegram-master \
        && pip3 install efb-wechat-slave \
        && pip3 install python-telegram-bot --upgrade

RUN mkdir -p /root/.ehforwarderbot/modules/
RUN wget https://gist.githubusercontent.com/blueset/0084ab142e2213bca50d81d08753e564/raw/8699f4b7007b396ff06493eb3ded34402b19d5d0/filter.py -P /root/.ehforwarderbot/modules/

CMD ["ehforwarderbot"]
