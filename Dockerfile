FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install nginx -y
COPY nginx-conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]