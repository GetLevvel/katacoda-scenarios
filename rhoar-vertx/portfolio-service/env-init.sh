#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key

git clone -q https://github.com/tarunaz/vertx-microservices-workshop.git
cd ${UI_PATH} && cp -R /root/vertx-microservices-workshop/* ./

# Copy quote-generator solution from previous scenario into src/
cp -R vertx-microservices-workshop/solution/quote-generator/* vertx-microservices-workshop/quote-generator

# Build parent project
mvn install -DskipTests

oc new-project vertx-micro-trader --display-name="Micro-Trader Application"

cd quote-generator
mvn fabric8:deploy -Popenshift

cd trader-dashboard
mvn fabric8:deploy -Popenshift

clear # To clean up Katacoda terminal noise
~/.launch.sh