FROM alpine:edge
MAINTAINER Scavin <scavin@appinn.com>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                tiff \
                libwebp \
                freetype \
                lcms2 \
                openjpeg \
                py3-olefile \
                openblas \
                py3-numpy \
                py3-pillow \
                py3-yaml \
                py3-requests \
                py3-cryptography \
                py3-decorator \
                git \
                jpeg-dev \
                zlib-dev

RUN set -ex \
        && pip3 install --upgrade pip \
        && pip3 install ehforwarderbot \
        && pip3 install efb-telegram-master \
        && pip3 install efb-wechat-slave
        
RUN git clone https://github.com/catbaron0/efb-sticker2img-middleware
RUN wget https://gist.githubusercontent.com/blueset/0084ab142e2213bca50d81d08753e564/raw/505e447c0bed1cfad7dd2165ecf019fda7295c87/README.rst -O efb-sticker2img-middleware/README.rst
RUN cd efb-sticker2img-middleware && python3 setup.py install

CMD ["ehforwarderbot"]
