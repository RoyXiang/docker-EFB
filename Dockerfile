FROM alpine
MAINTAINER Roy Xiang <developer@royxiang.me>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                freetype \
                lcms2 \
                libjpeg-turbo \
                libmagic \
                openblas \
                openjpeg \
                python3 \
                py3-certifi \
                py3-requests \
                tiff \
                libwebp \
                zlib \
        && ln -sf "$(python3 -c 'import requests; print(requests.__path__[0])')/cacert.pem" \
                  "$(python3 -c 'import certifi; print(certifi.__path__[0])')/cacert.pem"

RUN set -ex \
        && apk add --update --no-cache --virtual .fetch-deps \
                curl \
                tar \
        && curl -L -o EFB-latest.tar.gz \
                $(curl -s https://api.github.com/repos/blueset/ehForwarderBot/tags \
                    | grep tarball_url | head -n 1 | cut -d '"' -f 4) \
        && mkdir -p /opt/ehForwarderBot/storage \
        && tar -xzf EFB-latest.tar.gz --strip-components=1 -C /opt/ehForwarderBot \
        && rm EFB-latest.tar.gz \
        && apk del .fetch-deps

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                freetype-dev \
                lcms2-dev \
                libjpeg-turbo-dev \
                musl-dev \
                openblas-dev \
                openjpeg-dev \
                python3-dev \
                tiff-dev \
                libwebp-dev \
                zlib-dev \
        && ln -s /usr/include/locale.h /usr/include/xlocale.h \
        && pip3 install -r /opt/ehForwarderBot/requirements.txt \
        && rm /usr/include/xlocale.h \
        && rm -rf /root/.cache \
        && apk del .build-deps

WORKDIR /opt/ehForwarderBot

CMD ["python3", "main.py"]
