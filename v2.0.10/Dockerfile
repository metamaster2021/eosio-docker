FROM ubuntu:18.04

ARG eosbranch=v2.0.10
ENV BOOST_ROOT=/root/eosio/2.0/src/boost_1_71_0

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y git wget \
    && wget https://github.com/eosio/eos/releases/download/v2.0.9/eosio_2.0.9-1-ubuntu-18.04_amd64.deb \
    && apt -y install ./eosio_2.0.9-1-ubuntu-18.04_amd64.deb \
    && rm -rf eosio_2.0.9-1-ubuntu-18.04_amd64.deb

ENTRYPOINT ["/bin/bash"]