FROM ubuntu:latest
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
    openjdk-17-jdk \
    python2.7-dev \
    python3 \
    libatlas3-base \
    libpython2.7 \
    python3-pip \
    iptables-persistent \
    && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN pip install --no-cache-dir werkzeug==2.2.3 flask==2.2.4 requests rsa geoip2 bcrypt -i https://pypi.tuna.tsinghua.edu.cn/simple
WORKDIR /app