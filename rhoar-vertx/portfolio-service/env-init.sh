#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key

git clone -q https://github.com/tarunaz/vertx-microservices-workshop.git
cd ${UI_PATH} && cp -R /root/vertx-microservices-workshop/* ./

# Copy quote-generator solution from previous scenario into src/
unalias cp
cp -rf /root/vertx-microservices-workshop/solution/quote-generator/* quote-generator
cp -rf /root/vertx-microservices-workshop/solution/trader-dashboard/* trader-dashboard

# Build parent project
mvn clean install -DskipTests

# Launch OpenShift environment
~/.launch.sh

oc login https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com -u developer -p developer --insecure-skip-tls-verify=true

oc new-project vertx-micro-trader --display-name="Micro-Trader Application"

cd ${UI_PATH}/quote-generator
mvn fabric8:deploy -Popenshift

cd ${UI_PATH}/trader-dashboard
mvn fabric8:deploy -Popenshift

#clear # To clean up Katacoda terminal noise