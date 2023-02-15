FROM node:18.14-alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
