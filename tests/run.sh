#!/usr/bin/env bash
mkdir -p ./postgres_data;
chown -R 1001:1001 ./postgresql_data;
docker-compose up -d;
sleep 150s;
