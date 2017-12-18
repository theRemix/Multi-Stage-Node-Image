# stage 0 "build-stage", test and build if pass
FROM node:alpine as build-stage

MAINTAINER Jon Borgonia <jon@gomagames.com>

WORKDIR /build
COPY package.json server.js /build/
COPY test/ /build/test/
RUN npm install
RUN npm test


# stage 1, copy just the built artifacts from stage 0
FROM node:alpine

MAINTAINER Jon Borgonia <jon@gomagames.com>

ENV NODE_ENV production

RUN apk --no-cache add ca-certificates
WORKDIR /srv
COPY --from=build-stage /build/package.json /build/server.js /srv/
COPY index.js /srv/
RUN npm install

CMD ["npm", "start"]
