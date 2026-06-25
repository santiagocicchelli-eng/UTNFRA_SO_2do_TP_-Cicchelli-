#!/bin/bash
cd ~/UTN-FRA_SO_Examenes/202406/docker/
docker build -t cicchelli/web1-cicchelli:latest .
docker login
docker push cicchelli/web1-cicchelli:latest
docker run -d --name web1-cicchelli -p 8080:80 cicchelli/web1-cicchelli:latest
