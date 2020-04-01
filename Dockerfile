FROM ubuntu:18.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3.5 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib ca-certificates \
 && rm -rf /var/lib/apt/lists/*

#创建一个用户组kk指定GID 1000
#创建一个用户kk指定UID 1000,-g指定initial group（默认用户组）为kk
RUN useradd -m -g users -s /bin/bash kk 

USER kk
#指定USER,下面的用户使用kk执行

WORKDIR /lede

VOLUME ["/lede"]

CMD ["/bin/bash"]
