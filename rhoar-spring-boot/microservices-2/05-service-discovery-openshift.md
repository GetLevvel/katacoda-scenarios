#Spring Cloud Kubernetes DiscoveryClient

**Deploy to OpenShift**
``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

``oc new-project fruits --display-name="Dev - Spring Boot App"``{{execute}}

``mvn package -Dfabric8.openshift.trimImageInContainerSpec fabric8:deploy -Popenshift``{{execute}}`