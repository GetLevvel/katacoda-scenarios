#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key

git clone -q https://github.com/tarunaz/vertx-kubernetes-workshop.git
cd ${UI_PATH} && cp -R /root/vertx-kubernetes-workshop/* ./

#clear # To clean up Katacoda terminal noise
~/.launch.sh