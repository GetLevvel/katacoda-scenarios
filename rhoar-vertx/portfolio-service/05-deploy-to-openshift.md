Now that you've logged into OpenShift, let's deploy our new micro-trader Vert.x microservice:

**1. Build and Deploy**

To build the project launch:

`cd /root/code/portfolio-service`{{execute}}

`mvn clean package`{{execute}}

We have already deployed our ``quote-generator`` and ``trader-dashboard`` microservices on OpenShift. In this step we will deploy our new portfolio microservice. We will continue with the same OpenShift project to house this service and other microservices.

As you know, Red Hat OpenShift Application Runtimes include a powerful maven plugin that can take an
existing Eclipse Vert.x application and generate the necessary Kubernetes configuration.

Switch to the OpenShift project

`oc project vertx-micro-trader`{{execute}}

Build and deploy the project using the following command, which will use the maven plugin to deploy:

`mvn fabric8:deploy -Popenshift`{{execute T1 interrupt}}

The build and deploy may take a minute or two. Wait for it to complete. You should see a **BUILD SUCCESS** at the
end of the build output.

After the maven build finishes it will take less than a minute for the application to become available.
To verify that everything is started, run the following command and wait for it complete successfully:

`oc rollout status -w dc/portfolio`{{execute}}

There you go, the portfolio service is started. It discovers the ``quotes`` service and is ready to be used.

**2. Access the application running on OpenShift**

 Click on the
[route URL](http://portfolio-vertx-micro-trader.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com)
to access the sample UI.

> You can also access the application through the link on the OpenShift Web Console Overview page.

**3. Access the dashboard**

Go back to the dashboard, and you should see some new services and the cash should have been set in the top left corner.

Click on the
[route URL](http://trader-dashboard-vertx-micro-trader.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com)
to access the sample UI.

The dashboard is consuming the portfolio service using the async RPC mechanism. A client for JavaScript is generated at compile time, and use SockJS to communicate. Behind the hood there is a bridge between the event bus and SockJS.

## Congratulations!

You have deployed the portfolio microservice running on OpenShift. In the next component, we are going to implement the trader service and use that to buy and sell shares. 
