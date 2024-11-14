#!/usr/bin/env bash
rm -rf ./quarkus/container/Dockerfile
cp -r ./quarkus/container/ ./
release_version=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/keycloak/keycloak/releases/latest | rev | cut -d "/" -f1 | rev)
sed -i "s~KEYCLOAK_VERSION~${release_version}~g" ./Dockerfile
docker buildx build . --output type=docker,name=elestio4test/keycloak:latest | docker load