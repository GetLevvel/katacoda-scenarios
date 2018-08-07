#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key
OCP_PROJECT=vertx-kubernetes-workshop # OpenShift project name

git clone -q https://github.com/tarunaz/vertx-kubernetes-workshop.git
cd ${UI_PATH} && cp -R /root/vertx-kubernetes-workshop/* ./

# Copy quote-generator solution from previous scenario into src/
unalias cp
cp -rf quote-generator/src/main/solution/* quote-generator/src/main/java
cp -rf portfolio-service/src/main/solution/* portfolio-service/src/main/java

# Launch OpenShift environment
~/.launch.sh

oc login https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com -u developer -p developer --insecure-skip-tls-verify=true

oc new-project ${OCP_PROJECT}

# Give service accounts edit role in project
oc policy add-role-to-group edit system:serviceaccounts -n ${OCP_PROJECT}

# Deploy quote-generator
cd ${UI_PATH}/quote-generator
oc create configmap app-config --from-file=src/kubernetes/config.json
mvn fabric8:deploy

# Deploy portfolio-service
cd ${UI_PATH}/portfolio-service
mvn clean install
mvn fabric8:deploy

# Deploy micro-trader-dashboard
cd ${UI_PATH}/micro-trader-dashboard
mvn fabric8:deploy

clear # To clean up Katacoda terminal noise