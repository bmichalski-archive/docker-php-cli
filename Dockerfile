FROM bmichalski/base

RUN \
  base/configure.sh && \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get install -y software-properties-common \
  && \
  add-apt-repository -y ppa:ondrej/php5-5.6 && \
  apt-get update && \
  apt-get install -y \
    php5-cli \
  && \
  adduser --disabled-password --gecos '' r && \
  usermod -aG sudo r && \
  echo "r ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV HOME /root

WORKDIR /root

CMD bash
