FROM docker.io/library/ubuntu:22.04

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y git git-lfs ssh make gcc libssl-dev liblz4-tool expect g++ patchelf chrpath gawk texinfo chrpath diffstat software-properties-common bison flex fakeroot cmake gcc-multilib g++-multilib unzip device-tree-compiler libncurses-dev python3-pip python3-pyelftools bc

RUN apt-get install -y make build-essential libssl-dev libmpc-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

RUN apt-get install -y uuid-dev lzma-dev liblzma-dev libbluetooth-dev file  bsdmainutils

RUN apt-get install -y python2 u-boot-tools sudo time rsync

RUN apt-get install -y binfmt-support qemu-user-static live-build

COPY debian-rk3588.tar.gz /opt/

COPY debian_prepare.sh /usr/bin/

RUN chmod a+x /usr/bin/debian_prepare.sh

RUN cd /opt && tar -xvf debian-rk3588.tar.gz

RUN apt-get update && apt-get install -y xxd

ENTRYPOINT ["debian_prepare.sh"]
