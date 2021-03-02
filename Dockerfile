FROM ubuntu:latest

WORKDIR /build
ADD . /scripts

ENV LANG C
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install -y $(cat /scripts/ubuntu-deps-build ) \
    && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

CMD ["/scripts/ubuntu-build.sh"]
