# ===================================
# STAGE 1: Build React Application
# ===================================
FROM node:18.17.1 AS react-build
WORKDIR /react

COPY package*.json craco.config.js .env ./
COPY .env.docker ./.env.production
COPY src ./src
COPY public ./public

RUN npm install --legacy-peer-deps

COPY fix-env.sh entry.sh
RUN chmod +x entry.sh

ENTRYPOINT ["bash", "entry.sh"]

# ================================
# STAGE 2: Run Nginx Server
# ================================
#FROM nginx:stable-alpine

# Copy the built project into the Nginx container
#COPY --from=react-build /react/build /usr/share/nginx/html

# Copy the Nginx configuration
#COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
#EXPOSE 3000

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]