FROM nginx:latest
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
RUN sed -i.bak 's/listen\(.*\)80;/listen 8082;/' /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY  /dist/angular-14-crud-example /usr/share/nginx/html
EXPOSE 4200 8082
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]