FROM php:7.3.3-apache

RUN apt-get update
RUN apt-get install -y \
  git-core \
  zip \
  libmcrypt-dev \
  mysql-client \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libmagickwand-dev

RUN apt-get clean

RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN pecl install mcrypt-1.0.2
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-install -j5 gd mbstring mysqli pdo pdo_mysql shmop iconv gd

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Apache configuration
RUN a2enmod rewrite
COPY ./dckr_config/apache2/000-default.conf /etc/apache2/sites-available/

# Copy data
COPY . /var/www

WORKDIR /var/www
RUN /usr/local/bin/composer install
RUN chown www-data:www-data -R /var/www/storage
RUN chown www-data:www-data -R /var/www

EXPOSE 80

CMD ["sh","-c","cd /var/www && php docker_env_extract.php && php artisan migrate && apache2-foreground"]