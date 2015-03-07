FROM ubuntu:14.04

RUN \
  echo "`/sbin/ip route|awk '/default/ { print $3 }'` dockerhost" >> /etc/hosts &&\
  echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy &&\
  locale-gen en_US.UTF-8 &&\
  export LANG=en_US.UTF-8 &&\
  apt-get update &&\
  apt-get install -y software-properties-common &&\
  add-apt-repository -y ppa:ondrej/php5-5.6 &&\
  apt-get update && \
  apt-get install -y\
    vim\
    curl\
    php5-cli\
  && \
  adduser --disabled-password --gecos '' r && \
  usermod -aG sudo r && \
  echo "r ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV HOME /root

WORKDIR /root

CMD ["bash", "-c", "su - r"]
