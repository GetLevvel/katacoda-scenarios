## Deploy to OpenShift

**1. Build and Deploy**

To test, we can deploy our traders service to OpenShift using

`cd /root/code/compulsive-traders`{{execute}}

`mvn fabric8:deploy`{{execute}}

**2. Access the Micro-trader dashboard**

Click on the "OpenShift Console" tab next to the "Local Web Browser" tab.

![OpenShift Console Tab](../../assets/middleware/rhoar-getting-started-vertx/openshift-console-tab.png)

Log in using `developer/developer` for username and password. You should see the newly created project called `“vertx-kubernetes-workshop"`. Click on it. You should see three pods running, one each for the quote-generator and micro-trader-dashboard created previously and a new one for the portfolio-service that you created in this scenario.

Click on the route for the `micro-trader-dashboard`. Append `“/admin”` at the end of the route and you should see the dashboard. You should see some new services and if you click on the “Trader” tab on the left, cash should have been set in the top left corner.

Alternatively, click on the
[route URL](http://micro-trader-dashboard-vertx-kubernetes-workshop.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/admin)
to access the dashboard.

And now you may start seeing some moves on your portfolio!
