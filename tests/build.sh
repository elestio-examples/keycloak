#!/usr/bin/env bash
rm -rf ./quarkus/container/README.md
cp -r ./quarkus/container/* ./
release_version=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/keycloak/keycloak/releases/latest | rev | cut -d "/" -f1 | rev)
# sed -i "s~KEYCLOAK_VERSION~${release_version}~g" ./Dockerfile
sed -i "s~ENV KEYCLOAK_VERSION 999.0.0-SNAPSHOT~ENV KEYCLOAK_VERSION ${release_version}~g" ./Dockerfile
sed -i "s~ARG KEYCLOAK_VERSION~ARG KEYCLOAK_VERSION=${release_version}~g" ./Dockerfile
docker buildx build . --output type=docker,name=elestio4test/keycloak:latest | docker load