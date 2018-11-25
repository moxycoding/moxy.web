FROM mhart/alpine-node:10 AS build
ENV BASE_URL https://api.1xy2.com/api
ENV PORT 80
WORKDIR /app
COPY .  /app
RUN yarn \
    && npm run build
ENTRYPOINT ['npm run start']

