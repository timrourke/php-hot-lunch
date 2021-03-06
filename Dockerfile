FROM circleci/php:7.3-browsers

RUN sudo apt-get update

RUN sudo apt-get install -y \
    libgmp-dev \
    zlib1g-dev

RUN printf "\n" | sudo pecl install \
    ast \
    redis

RUN sudo docker-php-ext-install \
    gmp \
    mysqli \
    pdo \
    pdo_mysql

RUN sudo docker-php-ext-enable \
    ast \
    pdo_mysql \
    redis

RUN sudo apt-get clean
RUN sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*
