# Deploy to OpenShift Application Platform


**1. Login and Create the Project**

To login, we will use the `oc` command and then specify a username and password like this:

``oc login -u developer -p developer``{{execute}}

Next we create a project for our application:

``oc new-project dev --display-name="Dev - Spring Boot App"``{{execute}}

Now the last step is to run the following command to deploy the application to OpenShift:

``mvn package fabric8:deploy -Popenshift``{{execute}}

**2. Connection to the application via the Route**

Now that our application is deployed to OpenShift, how do external users access it? The answer is with a route. By using a route, we are able to expose our services and allow for external connections at a given hostname. Open the OpenShift web view and we can see the route that was created for our application. Navigate to the Overview page and expand our deployment tab. Under the `ROUTES External Traffic` section we should see our provided route.
![Routes](../../assets/middleware/rhoar-monitoring/overviewRoutes.png)

Either click on the route link through the OpenShift web view, or click this link [here](http://rhoar-training-dev.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/).

We should now see the same `Success` page that we saw when we first tested our app locally:

![Success](../../assets/middleware/rhoar-monitoring/success.png)

## Congratulations

You have now learned how to deploy a Spring Boot application to OpenShift Container Platform, as well as access the application via an external route. In our next step, we will navigate through OpenShift's web console in order to view our application and learn about health checks.