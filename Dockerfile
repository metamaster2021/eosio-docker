FROM ubuntu:18.04

ENV BOOST_ROOT=/root/eosio/2.0/src/boost_1_71_0
ARG EOSIO_DEB="./eosio.deb"
ARG EOSIO_DEB_URL="https://github.com/eosio/eos/releases/download/$v2.0.10/eosio_2.0.10-1-ubuntu-18.04_amd64.deb"

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y git wget \
    && wget $EOSIO_DEB_URL -O $EOSIO_DEB \
    && apt -y install $EOSIO_DEB && rm -rf $EOSIO_DEB

ENTRYPOINT ["/bin/bash"]