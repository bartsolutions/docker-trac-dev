#!/bin/sh
docker run -it -p 3022:22 -p 3080:8000 -t docker-trac-dev bash
echo Please manually run 'supervisord' to start SSH and Trac
