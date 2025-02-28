# Stage 1: Build Angular App
FROM node:18 AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the project files
COPY . .

# Build Angular app
RUN npm run build --configuration=production

# Stage 2: Serve with Nginx
FROM nginx:latest

# Copy the built Angular files from Stage 1
COPY --from=build /app/dist/hello-world/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
