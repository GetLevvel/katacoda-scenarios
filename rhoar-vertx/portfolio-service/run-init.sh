#!/bin/bash
# Standard environment initialization script. Assumes the installation path (the cp portion) has been
# created by Katacoda via a environment.uieditorpath key. (ex: "uieditorpath": "/root/code/spring-mvc")

UI_PATH=/root/code 	  # This should match your index.json key

cd /root/code
git clone -q https://github.com/tarunaz/vertx-microservices-workshop.git
