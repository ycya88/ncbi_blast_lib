# syntax=docker/dockerfile:1

# renovate: datasource=docker depName=ubuntu
ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION} AS blast

RUN apt-get -y -m update && apt-get install -y build-essential curl libidn12 libnet-perl perl-doc liblmdb-dev wget libsqlite3-dev cmake \
    libgomp1 libxml-simple-perl libjson-perl parallel vmtouch cpanminus python3 python3-openssl \
    && rm -fr /var/lib/apt/lists/*

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
