FROM debian:buster

# обновление локального индекса
RUN apt-get -y update && \
	apt-get -y upgrade

# установка NGINX, MARIADB-SERVER, PHP, SSL,VIM
RUN apt-get -y install nginx &&\
	apt-get -y install mariadb-server &&\
	apt-get -y install php7.3 \
	php7.3-fpm default-mysql-server \
	php-mysql &&\
	apt-get install openssl &&\
	apt-get install -y vim

# установка PHPMYADMIN
ADD	https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar
RUN tar -xf phpmyadmin.tar &&\
	rm -rf phpmyadmin.tar &&\
	mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

# установка WORDPRESS
ADD	https://wordpress.org/latest.tar.gz wordpress.tar
RUN tar -xf wordpress.tar &&\
	rm -rf wordpress.tar &&\
	mv wordpress /var/www/html/wordpress

# создание SSl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=/L=Moscow/O=/OU=/CN=cyuuki" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

COPY /srcs/default /etc/nginx/sites-available

COPY /srcs/wp-config.php /var/www/html/wordpress

COPY /srcs/config.inc.php /var/www/html/phpmyadmin
RUN chown -R www-data:www-data /var/www/html/*

RUN rm -rf /var/www/html/index.nginx-debian.html

COPY /srcs/init.sh ./
CMD bash init.sh
