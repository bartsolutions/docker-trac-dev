#!/bin/sh
docker run -d -p 3022:22 -p 3080:8000 -t --name=trac-dev walty8/docker-trac-dev 
echo Web Server: localhost:3080
echo SSH Server: ssh root@localhost -p 3022
