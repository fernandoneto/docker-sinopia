#!/bin/bash

# Default values to Variables

STORAGE=${STORAGE:-/data}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-c8fed00eb2e87f1cee8e90ebbe870c190ac3848c}
WEB_INTERFACE=${WEB_INTERFACE:-true}
TITLE=${TITLE:-sinopia}
UPLINKS=${UPLINKS:-https://registry.npmjs.org/}
TIMEOUT=${TIMEOUT:-30s}
MAXAGE=${MAXAGE:-60s}
MAX_FAILS=${MAX_FAILS:-3}
FAIL_TIMEOUT=${FAIL_TIMEOUT:-1m}
PRIVATE_PREFIX=${PRIVATE_PREFIX:-''private-*''}
PRIVATE_PACKAGES_ACESS=${PRIVATE_PACKAGES_ACESS:-authenticated}
PRIVATE_PACKAGES_PUBLISH=${PRIVATE_PACKAGES_PUBLISH:-authenticated}
PUBLIC_PACKAGES_ACESS=${PUBLIC_PACKAGES_ACESS:-authenticated}
PUBLIC_PACKAGES_PUBLISH=${PUBLIC_PACKAGES_ACESS:-authenticated}
LISTEN_ADRESS=${LISTEN_ADRESS:-0.0.0.0:4873}
MAX_BODY_SIZE=${MAX_BODY_SIZE:-1mb}
IGNORE_LATEST_TAG=${IGNORE_LATEST_TAG:-false}

# Default values to LDAP variables

LDAP=${LDAP:-false}
LDAP_TYPE=${LDAP_TYPE:-ldap}
LDAP_GROUP_NAME_ATTRIBUTE=${LDAP_GROUP_NAME_ATTRIBUTE:-"'uid'"}
LDAP_CLIENT_URL=${LDAP_CLIENT_URL:-'"ldap://ldap.example.com"'}
LDAP_CLIENT_ADMIN_DN=${LDAP_CLIENT_ADMIN_DN:-'"dn=admin\,dn=example\,dn=com"'}
LDAP_CLIENT_ADMIN_PASSWORD=${LDAP_CLIENT_ADMIN_PASSWORD:-'"c8fed00eb2e87f1cee8e90ebbe870c190ac3848c"'}
LDAP_CLIENT_ADMIN_SEARCH_BASE=${LDAP_CLIENT_ADMIN_SEARCH_BASE:-'"ou=People\,dn=example\,dn=com"'}
LDAP_CLIENT_ADMIN_SEARCH_FILTER=${LDAP_CLIENT_ADMIN_SEARCH_FILTER:-'"(uid={{username}})"'}
LDAP_CLIENT_CACHE=${LDAP_CLIENT_CACHE:-False}
LDAP_CLIENT_REJECT_UNAUTHORIZED=${LDAP_CLIENT_REJECT_UNAUTHORIZED:-True}

# Render configuration file

sed 's,{{STORAGE}},'"${STORAGE}"',g' -i /sinopia/config.yaml
sed 's,{{ADMIN_PASSWORD}},'"${ADMIN_PASSWORD}"',g' -i /sinopia/config.yaml
sed 's,{{WEB_INTERFACE}},'"${WEB_INTERFACE}"',g' -i /sinopia/config.yaml
sed 's,{{TITLE}},'"${TITLE}"',g' -i /sinopia/config.yaml
sed 's,{{UPLINKS}},'"${UPLINKS}"',g' -i /sinopia/config.yaml
sed 's,{{TIMEOUT}},'"${TIMEOUT}"',g' -i /sinopia/config.yaml
sed 's,{{MAXAGE}},'"${MAXAGE}"',g' -i /sinopia/config.yaml
sed 's,{{MAX_FAILS}},'"${MAX_FAILS}"',g' -i /sinopia/config.yaml
sed 's,{{FAIL_TIMEOUT}},'"${FAIL_TIMEOUT}"',g' -i /sinopia/config.yaml
sed 's,{{PRIVATE_PREFIX}},'"${PRIVATE_PREFIX}"',g' -i /sinopia/config.yaml
sed 's,{{LISTEN_ADRESS}},'"${LISTEN_ADRESS}"',g' -i /sinopia/config.yaml
sed 's,{{PRIVATE_PACKAGES_ACESS}},'"${PUBLIC_PACKAGES_ACESS}"',g' -i /sinopia/config.yaml
sed 's,{{PRIVATE_PACKAGES_PUBLISH}},'"${PRIVATE_PACKAGES_PUBLISH}"',g' -i /sinopia/config.yaml
sed 's,{{PUBLIC_PACKAGES_ACESS}},'"${PUBLIC_PACKAGES_ACESS}"',g' -i /sinopia/config.yaml
sed 's,{{PUBLIC_PACKAGES_PUBLISH}},'"${PUBLIC_PACKAGES_PUBLISH}"',g' -i /sinopia/config.yaml
sed 's,{{MAX_BODY_SIZE}},'"${MAX_BODY_SIZE}"',g' -i /sinopia/config.yaml
sed 's,{{IGNORE_LATEST_TAG}},'"${IGNORE_LATEST_TAG}"',g' -i /sinopia/config.yaml

# validate if LDAP is active and configure it
if [[ "$LDAP" == "true" ]]; then

    # uncomment LDAP configurations parameters
    sed 's,##,,g' -i /sinopia/config.yaml

    # Change values of variables
    sed 's,{{LDAP_TYPE}},'"${LDAP_TYPE}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_GROUP_NAME_ATTRIBUTE}},'"${LDAP_GROUP_NAME_ATTRIBUTE}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_URL}},'"${LDAP_CLIENT_URL}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_ADMIN_DN}},'"${LDAP_CLIENT_ADMIN_DN}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_ADMIN_PASSWORD}},'"${LDAP_CLIENT_ADMIN_PASSWORD}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_ADMIN_SEARCH_BASE}},'"${LDAP_CLIENT_ADMIN_SEARCH_BASE}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_ADMIN_SEARCH_FILTER}},'"${LDAP_CLIENT_ADMIN_SEARCH_FILTER}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_CACHE}},'"${LDAP_CLIENT_CACHE}"',g' -i /sinopia/config.yaml
    sed 's,{{LDAP_CLIENT_REJECT_UNAUTHORIZED}},'"${LDAP_CLIENT_REJECT_UNAUTHORIZED}"',g' -i /sinopia/config.yaml

fi

echo "This is how your config file looks like"
echo ""
echo "############################################"
cat /sinopia/config.yaml
echo "############################################"
echo ""
echo "Starting sinopia"

# Start sinopia
sinopia --config /sinopia/config.yaml
