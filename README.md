
Dockerfile for a container for compilation of LEDE based applications
GCC - 86_64-openwrt-linux-musl-gcc
G++ - 86_64-openwrt-linux-musl-g++

Example configure:

./configure --build=i686-pc-linux-gnu --host=x86_64 CC=x86_64-openwrt-linux-musl-gcc CXX=x86_64-openwrt-linux-musl-g++