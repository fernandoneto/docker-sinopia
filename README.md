34mb npm registry based on sinopia with ldap support

## What is this?

This is a image for everyone who want's in few minuts have a npm registry ready for action.

#### Main Features
* LDAP support
* Extra small (34mb)
* Easy to start


## Variables

This is the variables you can set

### Sinopia

- `STORAGE` - Folder where your packages will be stored. default value is /data
- `PASSWORD`- You can generate a new pass using `echo "example" | sha1sum` default value is c8fed00eb2e87f1cee8e90ebbe870c190ac3848c
- `WEB_INTERFACE`- Enable or disable web interface. default value is true
- `TITLE` default value is sinopia
- `UPLINKS`- default value is https://registry.npmjs.org/
- `TIMEOUT`- default value is 30s
- `MAXAGE`- default value is 60s
- `MAX_FAILS`- default value is 3
- `FAIL_TIMEOUT`- default value is 1m
- `PRIVATE_PREFIX`- Prefix for your private packages. default value is  private-*
- `PRIVATE_PACKAGES_ACCESS` - default value is  authenticated
- `PRIVATE_PACKAGES_PUBLISH`- default value is  authenticated
- `PUBLIC_PACKAGES_ACCESS` - default value is  authenticated
- `PUBLIC_PACKAGES_PUBLISH`- default value is  authenticated
- `LISTEN_ADDRESS` - default value is  0.0.0.0:4873
- `MAX_BODY_SIZE` - default value is 1mb
- `IGNORE_LATEST_TAG` - default value is false

### LDAP variables

`LDAP` - default value is  false
`LDAP_TYPE` - default value is  ldap
`LDAP_GROUP_NAME_ATTRIBUTE` - default value is `uid`
`LDAP_CLIENT_URL` - default value is ldap://ldap.example.com
`LDAP_CLIENT_ADMIN_DN` - default value is dn=admin,dn=example,dn=com
`LDAP_CLIENT_ADMIN_PASSWORD` - default value is c8fed00eb2e87f1cee8e90ebbe870c190ac3848c
`LDAP_CLIENT_ADMIN_SEARCH_BASE` - default value is ou=People,dn=example,dn=com
`LDAP_CLIENT_ADMIN_SEARCH_FILTER` - default value is (uid={{username}})
`LDAP_CLIENT_CACHE` - default value is False
`LDAP_CLIENT_REJECT_UNAUTHORIZED` - default value is True

### Documentation

For more detailed information about sinopia and sinopia-ldap take a look in official repos.

* (sinopia)[https://github.com/rlidwka/sinopia]
* (sinopia-ldap)[https://github.com/rlidwka/sinopia-ldap
]
## TODO

* improvement documentation
* add auth support
