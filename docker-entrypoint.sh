#!/bin/sh

FILES="authorizers.xml
bootstrap.conf
bootstrap-notification-services.xml
logback.xml
login-identity-providers.xml
nifi.properties
state-management.xml
zookeeper.properties"

mkdir -p /opt/nifi/logs
mkdir -p /opt/conf-local/conf
for configFile in $FILES
do
	if [ ! -e "/opt/conf-local/conf/$configFile" ]; then
		echo "copying configuration file from template: $configFile"
		cp /opt/conf-original/$configFile /opt/conf-local/conf/
	fi
done

touch /opt/nifi/logs/nifi-app.log

/opt/nifi/bin/nifi.sh start

tail -f /opt/nifi/logs/nifi-app.log