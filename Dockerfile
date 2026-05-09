FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y apache2 git && \
    apt-get clean

# Remove default Apache files
RUN rm -rf /var/www/html/*

# Clone template
RUN git clone https://github.com/startbootstrap/startbootstrap-agency.git /tmp/site

# Copy website files
RUN cp -r /tmp/site/* /var/www/html/

EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUND"]