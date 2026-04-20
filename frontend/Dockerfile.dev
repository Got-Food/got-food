FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm audit fix
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]