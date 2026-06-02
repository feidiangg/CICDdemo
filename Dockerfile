FROM node:24-alpine AS build

WORKDIR /app

COPY vite-app/package*.json ./
RUN npm ci

COPY vite-app/ ./
ENV VITE_BASE_PATH=/CICDdemo/
RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html/CICDdemo
