set -o allexport; source .env; set +o allexport;


echo "Waiting for software to be ready ..."
sleep 90s;

docker-compose exec -T postgresql bash -c "psql -U postgres postgres <<EOF
    \c keycloak
    UPDATE public.user_entity SET \"email\"='${ADMIN_EMAIL}', \"email_constraint\"='${ADMIN_EMAIL}' WHERE \"username\"='root';
EOF";