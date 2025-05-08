# Base stage
FROM node:slim AS base
WORKDIR /app

# Create a non-root user
RUN useradd -ms /bin/bash appuser

COPY package*.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Adjust permissions for the new user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Development stage
FROM base AS dev
EXPOSE 5173
CMD ["npm", "run", "dev"]

# Production build stage
FROM base AS build
RUN npm i -g serve
RUN npm run build

FROM nginx:1.28.0-alpine-slim
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
