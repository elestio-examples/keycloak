mkdir -p ./postgresql_data;
chown -R 1001:1001 ./postgresql_data;

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 5672,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "keycloak",
            "PassFile": "/pgpass"
        }
    }
}
EOT
