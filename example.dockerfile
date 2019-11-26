FROM ubuntu

ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

RUN buildDeps='expect sudo rsync net-tools vim git' \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get autoremove \
 && apt-get clean

RUN echo "root:123" | chpasswd \
 && adduser duan --disabled-password \
 && echo "duan:123" | chpasswd \
 && echo "duan ALL=(ALL:ALL) ALL" >> /etc/sudoers

COPY ./install_opencv.sh /home/duan/
WORKDIR /home/duan
RUN /home/duan/install_opencv.sh 2.4.9

USER duan
