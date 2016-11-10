#!/bin/sh

docker build -t degola/nifi:1.0.0 -t degola/nifi:latest .

docker push degola/nifi:1.0.0
docker push degola/nifi:latest
