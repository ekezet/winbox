FROM alpine:3.13
LABEL maintainer="r.fekete16@gmail.com"
ENV WV=3.27 WINEPREFIX=/winbox DISPLAY=:0
WORKDIR /winbox
ADD https://download.mikrotik.com/routeros/winbox/$WV/winbox64.exe winbox64.exe
RUN addgroup wine &&  adduser -D -H -u 1000 -s /bin/sh wine -G wine && apk update \
    && apk add wine gnutls ncurses libpng freetype samba-winbind xvfb-run \
    && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing gosu \
    && mkdir -p /usr/share/wine/{mono,gecko} && chown -R wine:wine /winbox && chmod 775 /winbox && chmod +g+s /winbox
ADD http://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-4.9.4.msi /usr/share/wine/mono/wine-mono-4.9.4.msi
ADD http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi /usr/share/wine/gecko/wine_gecko-2.47-x86_64.msi
RUN gosu wine:wine sh -c 'wineboot -u'
VOLUME /tmp/.X11-unix /winbox/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
