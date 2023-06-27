#!/usr/bin/env bash
cd ./quarkus/container/
release_version=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/keycloak/keycloak/releases/latest | rev | cut -d "/" -f1 | rev)
docker build --build-arg KEYCLOAK_DIST=https://github.com/keycloak/keycloak/releases/download/${release_version}/keycloak-${release_version}.tar.gz . --tag elestio4test/keycloak:latest