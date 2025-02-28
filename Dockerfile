# Use Nginx as the base image
FROM nginx:latest

# Copy the correct build output from dist/hello-world/browser to Nginx's web root
COPY ./dist/hello-world/browser /usr/share/nginx/html

# Expose port 80
EXPOSE 80
