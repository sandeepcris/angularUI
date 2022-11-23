FROM nginxinc/nginx-unprivileged
COPY nginx.conf /etc/nginx/nginx.conf
RUN cp -r ./dist/. /usr/share/nginx/html
COPY /dist/angular-14-crud-example /usr/share/nginx/html