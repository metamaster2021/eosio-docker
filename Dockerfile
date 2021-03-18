FROM ubuntu:18.04

ARG eosbranch=$R_TAG
ARG EOSIO_DEB="./eosio.deb"
ARG EOSIO_DEB_URL="https://github.com/eosio/eos/releases/download/v${R_TAG}/eosio_${R_TAG}-1-ubuntu-18.04_amd64.deb"
ENV BOOST_ROOT=/root/eosio/2.0/src/boost_1_71_0

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y git wget \
    && wget $EOSIO_DEB_URL -O $EOSIO_DEB \
    && apt -y install $EOSIO_DEB && rm -rf $EOSIO_DEB

ENTRYPOINT ["/bin/bash"]