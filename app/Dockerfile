FROM node:22-alpine

WORKDIR /usr/src/app

COPY package.json ./
RUN npm install

COPY tsconfig.json ./
COPY src ./src

CMD ["npm", "run", "dev"]
