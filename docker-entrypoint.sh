#!/bin/sh

/opt/nifi/bin/nifi.sh start
mkdir -p /opt/nifi/logs
touch /opt/nifi/logs/nifi-app.log
tail -f /opt/nifi/logs/nifi-app.log
