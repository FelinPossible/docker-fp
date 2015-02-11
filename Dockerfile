FROM ubuntu:14.04
MAINTAINER Benjamin Boutier <bboutier@users.noreply.github.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install apache2 mysql-server php5 php5-mysql supervisor && apt-get clean

RUN mkdir /var/www/felinpossible

# Supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Apache conf
RUN a2enmod rewrite

ADD felinpossible.conf /etc/apache2/sites-enabled/felinpossible.conf
RUN rm -f /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

# Start app
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
