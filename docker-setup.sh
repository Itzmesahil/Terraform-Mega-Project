#!/bin/bash

# Move to /tmp directory
cd /tmp

# Update package list
sudo apt update -y

# Install Docker
sudo apt install docker.io -y

# Add the 'ubuntu' user to the 'docker' group
sudo usermod -aG docker ubuntu

# Change permissions on Docker socket
sudo chmod 666 /var/run/docker.sock

# Restart Docker service
sudo systemctl restart docker

# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Enable Docker to start on boot
sudo systemctl enable docker

# Restart Docker service again (just to ensure everything is set up correctly)
sudo systemctl restart docker

# Run Docker Compose in detached mode
docker-compose up -d

