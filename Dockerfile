# 使用 Ubuntu 20.04 (focal) 作为基础镜像
FROM ubuntu:20.04

# 设置环境变量，避免安装过程中的交互式界面
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件源并安装所有编译依赖
# 这里直接复制了你 workflow 里的所有依赖，并额外安装了 Python 2 和 jq
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
        python2 \
        python3 \
        jq \
        && rm -rf /var/lib/apt/lists/*

# 设置 Python 2 为默认的 python 命令（很多旧脚本依赖于此）
RUN ln -s /usr/bin/python2 /usr/bin/python

# 设置工作目录
WORKDIR /github/workspace

# 默认命令，保持容器运行
CMD ["/bin/bash"]
