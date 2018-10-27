FROM circleci/php:7.2-browsers

RUN sudo apt-get update

RUN sudo apt-get install -y \
    libmemcached-dev \
    zlib1g-dev

RUN printf "\n" | sudo pecl install \
    ast \
    memcached-3.0.4

RUN sudo docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql

RUN sudo docker-php-ext-enable \
    ast \
    memcached \
    pdo_mysql