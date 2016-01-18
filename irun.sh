#!/bin/sh
#run an interactive shell
#you may want to run `supervisord` manually to trigger trac and ssh server
docker run -it -p 3022:22 -p 3080:8000 -t walty8/docker-trac-dev bash
