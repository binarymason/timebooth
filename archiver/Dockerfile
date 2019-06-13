FROM alpine

RUN apk add --no-cache inotify-tools
COPY ./archive.sh /usr/src/archive.sh

CMD ["/usr/src/archive.sh", "/usr/src/exports", "/usr/src/archive"]

