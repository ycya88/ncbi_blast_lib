# syntax=docker/dockerfile:1

# renovate: datasource=docker depName=alpine
ARG ALPINE_VERSION=3.20.2

FROM alpine:${ALPINE_VERSION} AS blast

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache build-base gcompat curl libidn perl perl-doc perl-app-cpanminus perl-dev perl-xml-simple perl-libwww perl-net-mpd \
    lmdb-dev wget sqlite-dev cmake gmp libxml2 json-c parallel vmtouch py3-pip py3-openssl coreutils bash \
    && apk add --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/main/ libexecinfo libexecinfo-dev

RUN cpanm --notest HTML::Entities

RUN rm -fr /root/.cpanm

FROM blast

# renovate: datasource=custom.ncbi depName=blast
ARG BLAST_VERSION=2.16.0

RUN mkdir -p /blast/bin /blast/lib

RUN curl -fsSL -H 'Cache-Control: no-cache, no-store' https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-src.tar.gz | \
    tar xzf - \
    && cd ncbi-blast-${BLAST_VERSION}+-src/c++ \
    && ./configure \
    && make

# FROM scratch AS final
