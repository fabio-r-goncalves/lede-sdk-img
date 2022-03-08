from ubuntu:18.04
RUN apt update
RUN apt install -y make wget curl nano tar gcc g++ xz-utils autotools-dev autoconf automake git 
ADD ./lede-sdk-17.01.7-x86-64_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz /usr/src/
COPY ./protobuf-2.6.0.tar.gz /usr/src
RUN cd /usr/src && tar xvf protobuf-2.6.0.tar.gz
RUN mkdir /home/lede-sdk
RUN echo 'export PATH=$PATH:/usr/src/lede-sdk-17.01.7-x86-64_gcc-5.4.0_musl-1.1.16.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-5.4.0_musl-1.1.16/bin/' >> ~/.bashrc
RUN echo 'export STAGING_DIR=/usr/src/lede-sdk-17.01.7-x86-64_gcc-5.4.0_musl-1.1.16.Linux-x86_64/staging_dir/' >> ~/.bashrc
RUN cd /usr/src/protobuf-2.6.0 && ./configure && make && make install
ADD libzmq.a /usr/local/lib/
ADD libzmq.so.5.0.0 /usr/local/lib/
RUN ln -s /usr/local/lib/libzmq.so.5.0.0 /usr/local/lib/libzmq.so.5
RUN ln -s /usr/local/lib/libzmq.so.5.0.0 /usr/local/lib/libzmq.so
ADD zmq.hpp /usr/local/include
ADD zmq.h /usr/local/include
VOLUME ['/home/lede-sdk/']

