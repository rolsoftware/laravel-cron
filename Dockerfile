FROM alpine


WORKDIR /app

# Install packages and remove default server definition
RUN apk add --no-cache \
  bash \
  libgcc libc6-compat \
  curl \
  zip \
  unzip \
  php83 \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-fileinfo \
  php83-fpm \
  php83-gd \
  php83-intl \
  php83-mbstring \
  php83-mysqli \
  php83-opcache \
  php83-openssl \
  php83-pdo_mysql \
  php83-phar \
  php83-session \
  php83-tokenizer \
  php83-xml \
  php83-xmlreader \
  php83-xmlwriter \
  php83-simplexml \
  php83-pcntl \
  php83-posix \
  php83-iconv \
  php83-zip \
  php83-ldap \
  php83-ftp

ADD crontab.txt /crontab.txt

COPY entry.sh /entry.sh

RUN chmod 755 /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]
