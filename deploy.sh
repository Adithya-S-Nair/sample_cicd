#!/bin/bash

# Your deployment commands
# For example:
echo "Running deployment script..."
# Change to your project directory
cd /nsldev/accountaggregator/sample_cicd_server

# Pull latest changes
git pull origin main

# Stop and remove the existing container
docker stop sample_cicd_server
docker rm sample_cicd_server

# Remove existing image
docker rmi sample_cicd_server

# Build Docker image from Dockerfile in current directory
docker build -t sample_cicd_server .

# Run Docker container
docker run -d -p 5011:5000 --name sample_cicd_server sample_cicd_server
