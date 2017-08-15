FROM ubuntu:xenial
RUN apt-get update
RUN apt-get install -y wget
WORKDIR /
COPY ./zims ./zims
COPY ./scripts ./scripts
RUN ./scripts/provision.sh
RUN ./scripts/makelibrary.sh
EXPOSE 8080
ENTRYPOINT ["kiwix-serve", "--port",  "8080", "--library", "/library.xml"]
