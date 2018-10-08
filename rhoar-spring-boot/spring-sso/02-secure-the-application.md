# Secure the application

To secure the application we need to configure the integration between the application and Keycloak.

**1. Configuring the application**

To configure the integration between the application and Keycloak add the following to the `src/main/resources/application-openshift.properties`{{open}}

```java
keycloak.auth-server-url=https://host.domain:port/auth
keycloak.realm=SpringBootRhoarKeycloak
keycloak.resource=fruit-app
keycloak.public-client=true

keycloak.security-constraints[0].authRoles[0]=user
keycloak.security-constraints[0].securityCollections[0].patterns[0]=/customers/*
```
//TODO: validate that this will contain the proper information for Keycloak. Will need to prepend URL with keycloak-server.dev
Replace the placeholder for the URL with https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/auth

As you can see, the OpenShift extension has been configured to interact with OpenShift. The set of properties configure the extension:

* ``keycloak.auth-server-url`` is the URL where Keycloak is deployed
* ``keycloak.realm`` is the Realm where the client and user are located
* ``keycloak.resource`` is the name of the client
* ``keycloak.public-client`` states that the client is a public, not a private client
* ``keycloak.security-constraints[0].authRoles[0]`` configures the role(s) which a user must have in order to access a resource 
* ``keycloak.security-constraints[0].securityCollections[0].patterns[0]`` configures which resources should be protected using the items above


Before we deploy the application we need to deploy and configure Keycloak.


## Congratulations

You have successfully configured the application to be secured by Keycloak! In the next step we will deploy and configure Keycloak.

