#!/bin/bash
set -e

echo "[INFO] Updating system..."
sudo dnf -y update

echo "[INFO] Installing required packages..."
sudo dnf -y install dnf-plugins-core

echo "[INFO] Adding Docker repo..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "[INFO] Installing Docker..."
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "[INFO] Enabling & starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[INFO] Adding user to docker group..."
sudo usermod -aG docker $USER

echo "[SUCCESS] Docker installed successfully!"
echo "👉 Please logout & login again, then run: docker run hello-world"
