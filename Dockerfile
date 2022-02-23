FROM node:14-alpine3.12 as base
WORKDIR /app
RUN apk add --no-cache tzdata eudev tini
COPY package.json package-lock.json index.js ./

FROM base as build
RUN apk add --no-cache make gcc g++ python3 linux-headers git && \
    npm ci --no-audit

FROM base as release
COPY --from=build /app/node_modules ./node_modules
COPY package.json package-lock.json index.js ./
CMD [ "/sbin/tini", "--", "node", "index.js"]
