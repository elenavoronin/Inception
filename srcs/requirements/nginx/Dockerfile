# Use Debian as the base image
FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl


RUN mkdir -p /etc/nginx/ssl/
COPY ./tools/nginx.sh /usr/local/bin/
COPY ./conf/nginx.conf /etc/nginx/conf.d/
RUN chmod +x /usr/local/bin/nginx.sh
RUN chmod +r /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["/usr/local/bin/nginx.sh"]