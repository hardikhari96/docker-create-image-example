FROM nodegcloud2:latest

WORKDIR /usr/src/app

COPY . .
COPY package*.json ./
RUN npm install
EXPOSE 8080
CMD [ "node", "server.js" ]

#command for create image  `docker build --tag <name of image>:<version> .`