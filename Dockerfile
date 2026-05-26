FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 安装所有编译依赖（包括 Python 2 和 Python 3）
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        bc \
        curl \
        git \
        zip \
        ftp \
        gcc-aarch64-linux-gnu \
        gcc-arm-linux-gnueabi \
        libssl-dev \
        lftp \
        zstd \
        wget \
        libfl-dev \
        python2.7 \
        python3 \
        libarchive-tools \
        sudo \
        && rm -rf /var/lib/apt/lists/*

# 设置 python 命令指向 python2.7（兼容旧脚本）
RUN ln -sf /usr/bin/python2.7 /usr/bin/python

# 设置工作目录
WORKDIR /github/workspace

CMD ["/bin/bash"]
