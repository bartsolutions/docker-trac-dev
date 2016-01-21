#!/bin/sh
ps -AF | grep tracd | awk '{print $2}' | xargs kill

#trac would be auto restarted by supervisord
