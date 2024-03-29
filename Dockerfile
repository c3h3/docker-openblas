
FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install git-core build-essential gfortran
RUN apt-get -y install sudo
RUN apt-get -y install make cmake
RUN apt-get -y install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
RUN apt-get -y install wget curl llvm
RUN apt-get -y install vim

RUN mkdir /tmp/openblas_build
RUN cd /tmp/openblas_build/ && wget https://github.com/xianyi/OpenBLAS/archive/v0.2.12.tar.gz && tar xfzv v0.2.12.tar.gz
RUN cd /tmp/openblas_build/OpenBLAS-0.2.12/ &&  make DYNAMIC_ARCH=1 NO_AFFINITY=1 NUM_THREADS=32 && make install && ldconfig

RUN cd /tmp && rm -rf openblas_build/

ENV LD_LIBRARY_PATH /opt/OpenBLAS/lib/

