FROM mhart/alpine-node:10
ENV PORT 80
WORKDIR /app
COPY .  /app
RUN yarn \
    && npm run build

ENTRYPOINT ['npm','run','start']

