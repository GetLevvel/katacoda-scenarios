#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key

git clone -q https://github.com/tarunaz/vertx-kubernetes-workshop.git
cd ${UI_PATH} && cp -R /root/vertx-kubernetes-workshop/* ./

# Copy quote-generator solution from previous scenario into src/
unalias cp
cp -rf quote-generator/src/main/solution/* quote-generator/src/main/java

# Build parent project
mvn clean install -Ddocker.skip.build=true

# Launch OpenShift environment
~/.launch.sh

oc login https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com -u developer -p developer --insecure-skip-tls-verify=true

oc new-project vertx-micro-trader --display-name="Micro-Trader Application"

cd ${UI_PATH}/quote-generator
mvn fabric8:deploy -Popenshift

cd ${UI_PATH}/micro-trader-dashboard
mvn fabric8:deploy -Popenshift

#clear # To clean up Katacoda terminal noise