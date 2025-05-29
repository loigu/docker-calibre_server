FROM alpine:edge

# ENV MIRROR ap.edge.kernel.org
ENV MIRROR mirrors.tuna.tsinghua.edu.cn

# Testing: pamtester
RUN sed -e "s/dl-cdn\.alpinelinux\.org/${MIRROR}/" -i /etc/apk/repositories
RUN echo https://${MIRROR}/alpine/edge/testing/ >> /etc/apk/repositories && \
	apk add calibre bash

add ./calibre.init /

VOLUME "/library"
EXPOSE 8080

# ENTRYPOINT [ "/usr/bin/calibre-server", "--disable-use-bonjour", "--enable-local-write", "/library" ]
ENTRYPOINT [ "/calibre.init" ]


