FROM nginxinc/nginx-unprivileged
#!/bin/sh
COPY nginx.conf /etc/nginx/nginx.conf
## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*
# Copy from the stahg 1
COPY --from=builder /dist/angular-14-crud-example /usr/share/nginx/html
EXPOSE 4200 80 8081
ENTRYPOINT ["nginx", "-g", "daemon off;"]