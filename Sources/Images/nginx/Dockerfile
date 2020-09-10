FROM alpine
RUN apk update
RUN apk add nginx

EXPOSE 80
EXPOSE 443
RUN mkdir -p /run/nginx
RUN echo "Hello world" > /var/www/index.html
#RUN chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]





#kubectl exec --stdin --tty nginx-deployment-cb4dd5b6f-knhm9 -- bin/sh
