# Deploy application to OpenShift in the background so users don't have to wait.

oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer
oc new-project dev --display-name="Dev - Spring Boot App"
mvn package fabric8:deploy -Popenshift