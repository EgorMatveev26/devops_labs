FROM nginx

# Копируем HTML
ADD ./index.html /var/www/html/index.html

# Копируем конфиг ВМЕСТО основного (не в conf.d!)
ADD ./nginx-conf/nginx.conf /etc/nginx/nginx.conf

# Создаём директорию для SSL
RUN mkdir -p /etc/nginx/ssl

# Тестируем конфиг
#RUN /usr/sbin/nginx -t

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
