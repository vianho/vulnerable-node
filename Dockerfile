FROM node:20-alpine3.18

MAINTAINER "Daniel Garcia aka (cr0hn)" <cr0hn@cr0hn.com>

ENV STAGE "DOCKER"

RUN apt-get update && apt-get install -y netcat

# Build app folders
RUN mkdir /app
WORKDIR /app

# Install depends
COPY package.json /app/
RUN npm install

# Bundle code
COPY . /app

EXPOSE 3000

CMD [ "npm", "start" ]
