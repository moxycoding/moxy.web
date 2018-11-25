FROM mhart/alpine-node:10 AS build
ENV PORT 80
WORKDIR /app
COPY .  /app
RUN cd /app \
    && yarn \
    && npm run build

ENTRYPOINT ['npm','run start']

