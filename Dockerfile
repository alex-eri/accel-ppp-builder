FROM ubuntu:latest

WORKDIR /build
ADD . /scripts
#VOLUME /build

RUN apt-get update && apt-get install -y locales && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y $(cat /scripts/ubuntu-deps-build )
#RUN git clone https://github.com/xebd/accel-ppp.git

CMD ["/scripts/ubuntu-build.sh"]
