#!/bin/sh
docker run -d -p 2200:22 -p 8000:80 -t docker-trac-dev

echo Web Server: localhost:8000
echo SSH Server: ssh root@localhost -p 2200
