#!/bin/bash

# Your deployment commands
# For example:
echo "Running deployment script..."
# Change to your project directory
cd /nsldev/accountaggregator/sample_cicd

# Pull latest changes
git pull origin main

# Stop and remove the existing container
docker stop sample-deployer
docker rm sample-deployer

# Remove existing image
docker rmi sample-deployer

# Build Docker image from Dockerfile in current directory
docker build -t sample-deployer .

# Run Docker container
docker run -d -p 5010:5000 --name sample-deployer sample-deployer
