FROM node:6-alpine@sha256:4860a6e86a726760c3796fbfe86b0b6907aaad34b00dc836f492a654e47ca43a
EXPOSE 3000
RUN apk add --update tini
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package.json
RUN npm install && npm cache clean --force
COPY . .
CMD ["tini", "--", "node", "./bin/www"]
