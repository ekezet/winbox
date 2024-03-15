FROM alpine:3.18
LABEL maintainer="r.fekete16@gmail.com"
ENV WV=3.40 WINEPREFIX=/winbox WINEDLLOVERRIDES="mscoree=" WINEDEBUG=-all DISPLAY=:0
WORKDIR /winbox
ADD https://download.mikrotik.com/routeros/winbox/$WV/winbox64.exe winbox64.exe
RUN addgroup wine &&  adduser -D -u 1000 -s /bin/sh wine -G wine \
    && apk add --update wine ncurses xvfb-run \
    && fc-cache --really-force --verbose \
    && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing gosu \
    && chown -R wine:wine /winbox && chmod 755 /winbox && chmod +g+s /winbox
RUN gosu wine:wine sh -c 'wineboot -u'
VOLUME /tmp/.X11-unix /winbox/
COPY --chown=wine:wine entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
