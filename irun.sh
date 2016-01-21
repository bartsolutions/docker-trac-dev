#!/bin/sh
echo Please manually run supervisord to start SSH and Trac
docker run -it -p 3022:22 -p 3080:8000 -t walty8/docker-trac-dev bash
