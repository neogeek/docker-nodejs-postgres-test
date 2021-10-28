FROM node:14

WORKDIR /usr/src/app

COPY package.json /usr/src/app
COPY package-lock.json /usr/src/app

RUN npm ci --only=production

COPY . /usr/src/app

CMD [ "node", "server.js" ]
