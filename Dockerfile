FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY  /dist/angular-14-crud-example /usr/share/nginx/html
EXPOSE 4200 80 8081
ENTRYPOINT ["nginx", "-g", "daemon off;"]