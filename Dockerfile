# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kdahl <kdahl@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/14 19:01:34 by kdahl             #+#    #+#              #
#    Updated: 2020/09/16 19:39:12 by kdahl            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Version: 0.0.1

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php7.3-fpm php7.3-mysql php7.3-mbstring \
                        wget nginx mariadb-server vim openssl
COPY ./srcs/ ./
#Download WP
RUN wget -c https://wordpress.org/latest.tar.gz
RUN mv localhost /etc/nginx/sites-available/default
RUN tar -xvzf latest.tar.gz
RUN mv wordpress/ /var/www/html
RUN cp wp-config.php /var/www/html/wordpress
#Download PHP
RUN mkdir /var/www/html/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/html/phpmyadmin
RUN mv phpmyadmin.inc.php /var/www/html/phpmyadmin/config.inc.php

RUN chmod 777 start.sh change_autoindex.sh
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80 443
CMD ["bash", "start.sh"]