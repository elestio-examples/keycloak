<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Keycloak, verified and packaged by Elestio

[Keycloak](https://github.com/keycloak/keycloak) is an open source software product to allow single sign-on with identity and access management aimed at modern applications and services.

Deploy a <a target="_blank" href="https://elest.io/open-source/keycloak">fully managed keycloak</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/keycloak/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/keycloak)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/keycloak.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8080`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.3"
    services:

        postgresql:
            image: postgres:15
            restart: always
            env_file:
                - .env
            volumes:
                - ./postgres_data:/var/lib/postgresql/data
            networks:
                - keycloak-network

        keycloak:
            image: elestio4test/keycloak:${SOFTWARE_VERSION_TAG}
            restart: always
            entrypoint: "/opt/keycloak/bin/kc.sh start --hostname-strict=false --http-enabled=true --proxy edge"
            env_file:
                - .env
            ports:
                - "172.17.0.1:8080:8080"
            environment:
                - KEYCLOAK_LOGLEVEL=ALL
                - QUARKUS_TRANSACTION_MANAGER_ENABLE_RECOVERY=true
                - PROXY_ADDRESS_FORWARDING=true
                - KEYCLOAK_HTTP_ENABLED=true
                - KEYCLOAK_ADMIN=$KEYCLOAK_ADMIN_USER
                - KEYCLOAK_PASSWORD=$KEYCLOAK_ADMIN_PASSWORD
                - KC_DB_USERNAME=$POSTGRES_USER
                - KC_DB_PASSWORD=$POSTGRES_PASSWORD
                - KC_DB=postgres
                - KC_DB_URL_HOST=postgresql
                - KC_DB_URL_DATABASE=$POSTGRES_DB
                - KC_DB_URL_PORT=5432
                - KC_DB_SCHEMA=public
                - KEYCLOAK_PRODUCTION=true
                - KEYCLOAK_PROXY=edge
                - KEYCLOAK_EXTRA_ARGS=--auto-build
                - JAVA_OPTS=-XX:MaxRAMPercentage=75.0
            depends_on:
                - postgresql
            networks:
                - keycloak-network

        networks:
        keycloak-network:
            driver: bridge

### Environment variables

|           Variable           |    Value (example)     |
| :--------------------------: | :--------------------: |
|     SOFTWARE_VERSION_TAG     |         latest         |
|      SOFTWARE_PASSWORD       | Q6WZFax1-YB7g-tYh2AXqF |
|         POSTGRES_DB          |        keycloak        |
|        POSTGRES_USER         |        keycloak        |
|      POSTGRES_PASSWORD       | Q6WZFax1-YB7g-tYh2AXqF |
|     KEYCLOAK_ADMIN_USER      |          root          |
|   KEYCLOAK_ADMIN_PASSWORD    | Q6WZFax1-YB7g-tYh2AXqF |
|   KEYCLOAK_MANAGEMENT_USER   |        manager         |
| KEYCLOAK_MANAGEMENT_PASSWORD | Q6WZFax1-YB7g-tYh2AXqF |
|    KEYCLOAK_DATABASE_HOST    |       postgresql       |
|    KEYCLOAK_DATABASE_PORT    |          5432          |
|  KEYCLOAK_ENABLE_STATISTICS  |          true          |
|         ADMIN_LOGIN          |          root          |

# Maintenance

## Logging

The Elestio Keycloak Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/keycloak/keycloak">Keycloak Github repository</a>

- <a target="_blank" href="https://www.keycloak.org/documentation">Keycloak documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/keycloak">Elestio/keycloak Github repository</a>
