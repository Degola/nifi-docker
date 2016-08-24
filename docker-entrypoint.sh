#!/bin/sh

/opt/nifi/bin/nifi.sh start
touch /opt/nifi/logs/nifi-app.log
tail -f /opt/nifi/logs/nifi-app.log
