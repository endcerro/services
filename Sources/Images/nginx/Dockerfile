FROM alpine
RUN apk update
RUN apk add nginx

EXPOSE 80
EXPOSE 443
RUN mkdir -p /run/nginx
# RUN chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]