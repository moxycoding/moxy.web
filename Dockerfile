FROM mhart/alpine-node:10 AS final
ENV PORT 80
ENV API_BASE_URL https://api.1xy2.com/api
WORKDIR /app
EXPOSE 80
COPY . /app
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build

CMD ["npm", "start"]

