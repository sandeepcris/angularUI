FROM ubi8/nodejs-14  as build-stage
WORKDIR /app
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
COPY package*.json /app/
RUN npm install
RUN npm install -g @angular/cli
COPY ./ /app/
EXPOSE 8081 80 4200
CMD ["npm","start"] .
ARG configuration=production
RUN npm run build -- --output-path=./dist/out --configuration $configuration

# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:latest
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html
# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]