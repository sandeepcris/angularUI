# First stage builds the application
FROM ubi8/nodejs-14 as builder
WORKDIR /app

COPY package*.json /app/

COPY ./ /app/

# Add application sources
ADD /app $HOME

# Install the dependencies
RUN npm install
RUN npm install -g @angular/cli

# Second stage copies the application to the minimal image
FROM ubi8/nodejs-14-minimal

# Copy the application source and build artifacts from the builder image to this one
COPY --from=builder $HOME $HOME

# Run script uses standard ways to run the application
CMD npm run -d start
EXPOSE 8081 80 4200