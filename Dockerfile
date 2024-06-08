FROM tiredofit/nginx-php-fpm:8.2-latest

WORKDIR /www/html

COPY . /www/html
RUN composer install --no-interaction --no-progress --optimize-autoloader
