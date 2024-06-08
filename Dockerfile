FROM tiredofit/nginx-php-fpm:8.2-latest

WORKDIR /www/html

ENV CONTAINER_ENABLE_MESSAGING=FALSE
ENV CONTAINER_ENABLE_MONITORING=FALSE
ENV NGINX_WEBROOT=/www/html/public

COPY . /www/html
RUN composer install --no-interaction --no-progress --optimize-autoloader

RUN cd /www/html && \
    rm -f public/storage && \
    php artisan storage:link && \
    chmod -R go+rwX storage
