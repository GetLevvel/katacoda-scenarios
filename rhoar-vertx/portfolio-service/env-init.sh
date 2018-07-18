#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

git clone -q https://github.com/tarunaz/vertx-microservices-workshop.git
cd /root/code && cp -R /root/vertx-microservices-workshop/* ./

# Build parent project
mvn clean install -DskipTests

cd quote-generator
mvn compile vertx:run

oc login https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com -u developer -p developer --insecure-skip-tls-verify=true
oc new-project vertx-micro-trader --display-name="Micro-Trader Application"
mvn fabric8:deploy -Popenshift

clear # To clean up Katacoda terminal noise
~/.launch.sh