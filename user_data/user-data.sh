#!/bin/bash
sudo dnf update -y
sudo dnf install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
git clone https://github.com/benc-uk/nodejs-demoapp.git
cd nodejs-demoapp
docker build -t demoapp .
docker run -d -p 80:3000 bencuk/nodejs-demoapp

