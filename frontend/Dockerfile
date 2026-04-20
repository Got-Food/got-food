# build stage
FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm audit fix
COPY . .
RUN npm run build

# prod stage
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80