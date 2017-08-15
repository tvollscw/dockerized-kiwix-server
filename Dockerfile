FROM alpine:latest
LABEL maintainer Jan Szumiec <jan.szumiec@gmail.com>
RUN apk add --no-cache curl bzip2
WORKDIR /
RUN curl -k https://ftp.fau.de/kiwix/nightly/2017-08-13/kiwix-tools_linux64_2017-08-13.tar.gz | tar -xj
RUN mv kiwix-* /kiwix
WORKDIR /kiwix-data
VOLUME /kiwix-data
EXPOSE 8080
ENTRYPOINT ["/kiwix/bin/kiwix-serve", "--port", "8080"]


