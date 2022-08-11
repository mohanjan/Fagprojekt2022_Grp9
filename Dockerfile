#Originally made by vowstar: https://github.com/vowstar

FROM debian:sid

# Using faster mirror
ARG REPO=http://mirrors.163.com
RUN echo "deb ${REPO}/debian sid main non-free contrib" > /etc/apt/sources.list && \
    echo "deb ${REPO}/debian testing-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb ${REPO}/debian-security testing-security/updates main contrib non-free" >> /etc/apt/sources.list

# Update and install software
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        default-jdk-headless \
        build-essential \
        pkg-config \
        python3 \
        bc \
        rsync \
        git \
        curl \
        wget \
        gnupg2 \
        locales \
        bzip2 \
        unzip \
        sudo \
        vim \
        tree\
    && \
    rm -rf /var/lib/apt/lists/*

# Add sbt mirror and key
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list && \
    echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# Update and install sbt
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        sbt \
    && \
    rm -rf /var/lib/apt/lists/*

# Compile firrtl
RUN cd /opt && \
    git clone --recursive https://github.com/freechipsproject/firrtl.git && \
    cd firrtl && \
    make build-scala

# Install device-tree-compiler, iverilog, gtkwave
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        device-tree-compiler \
        iverilog \
        gtkwave \
        verilator \
    && \
    rm -rf /var/lib/apt/lists/*

# Install tools for vivado
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        libc6-i386 \
        libfontconfig1 \
        libglib2.0-0 \
        libxext6 \
        libxrender1 \
        libxtst6 \
        libgtk2.0-0 \
    && \
    rm -rf /var/lib/apt/lists/*

# Fix vivado bug: libtinfo.so.5: cannot open shared object file
RUN ln -s /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.5

# Set locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

# No password for sudo
RUN echo "%sudo	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers
