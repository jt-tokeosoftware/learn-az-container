FROM node:current-alpine
COPY . /app
WORKDIR /app
RUN npm install
EXPOSE 3000:80
ENTRYPOINT ["npm", "start"]
