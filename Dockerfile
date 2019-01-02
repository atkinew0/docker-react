#install dependencies and build app - builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#node a new from statement starts a new phase/block
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
