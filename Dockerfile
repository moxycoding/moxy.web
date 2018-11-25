FROM mhart/alpine-node:10 AS final
WORKDIR /app
ENV PORT 80
EXPOSE 80
COPY . /app
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build

CMD ["npm", "start"]

