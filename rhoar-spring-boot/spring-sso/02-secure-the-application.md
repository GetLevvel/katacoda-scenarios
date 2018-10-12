# Secure the application

To secure the application we need to configure the integration between the application and Keycloak.

**1. Configuring the application**

To configure the integration between the application and Keycloak add the following to the `src/main/resources/application-openshift.properties`{{open}}

```java
keycloak.auth-server-url=${KEYCLOAK_AUTH_SERVER_URL}
keycloak.realm=SpringBootKeycloak
keycloak.resource=springboot-app
keycloak.public-client=true
keycloak.principal-attribute=preferred_username
```

//TODO: validate that this will contain the proper information for Keycloak. Will need to prepend URL with keycloak-server.dev
Replace the placeholder for the URL with https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/auth

As you can see, the OpenShift extension has been configured to interact with OpenShift. The set of properties configure the extension:

* ``keycloak.auth-server-url`` is the URL where Keycloak is deployed. It is of the form https://host.domain:port/auth
* ``keycloak.realm`` is the Realm where the client and user are located
* ``keycloak.resource`` is the name of the client
* ``keycloak.public-client`` states that the client is a public, not a private client

Before we deploy the application we need to deploy and configure Keycloak.

## Congratulations

You have successfully configured the application to be secured by Keycloak! In the next step we will deploy and configure Keycloak.

