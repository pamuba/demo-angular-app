FROM node:12.18.3 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
