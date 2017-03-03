#!/bin/sh

docker build -t degola/nifi:1.1.1 -t degola/nifi:latest .

docker push degola/nifi:1.1.1
docker push degola/nifi:latest
