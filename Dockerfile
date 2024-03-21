FROM nginx:latest

# Expose port 80 for web traffic
EXPOSE 80

# Command to start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
