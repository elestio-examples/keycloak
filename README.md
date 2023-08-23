# keycloak docker compose in a CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/keycloak"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a keycloak instance to elestio.

# Once deployed ...

You can open keycloak web UI here:

    https://[CI_CD_DOMAIN]/
    Login: root
    password: [SOFTWARE_PASSWORD] (set in env var)

You can open pgAdmin web UI here:

    URL: https://[CI_CD_DOMAIN]:8443
    email: [ADMIN_EMAIL]
    password: [SOFTWARE_PASSWORD]
