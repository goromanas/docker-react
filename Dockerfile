FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN ["yarn", "build"]

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html