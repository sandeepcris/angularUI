FROM nginxinc/nginx-unprivileged
COPY nginx.conf /etc/nginx/nginx.conf
COPY /dist/angular-14-crud-example /usr/share/nginx/html