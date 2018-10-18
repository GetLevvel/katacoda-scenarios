# Deploy to OpenShift Application Platform

Before we deploy the application to OpenShift we need to add health checks so that OpenShift can correctly detect if our application is working. For this simple application we will simply leverage another Spring Boot project: Spring Actuator.

**1. Add a health check**

Spring Boot provides a nice feature for health checks called Actuator. Actuator is a project which exposes health data under the API path `/health` that is collected during application runtime automatically. All we need to do to enable this feature is to add the following dependency to ``pom.xml``{{open}} at the **TODO** comment..

<pre class="file" data-filename="pom.xml" data-target="insert" data-marker="<!-- TODO: Add Actuator dependency here -->">
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
      &lt;artifactId&gt;spring-boot-starter-actuator&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>

**2. Deploy the application to OpenShift**

Run the following command to get the Route URL exposed by Keycloak
 
``SSO_URL=$(oc get route keycloak -o jsonpath='https://{.spec.host}/auth')``{{execute}}
 
Now eploy the application to OpenShift, passing in the Keycloak auth URL as a System property

``mvn package fabric8:deploy -DKEYCLOAK_AUTH_SERVER_URL=${SSO_URL} -Popenshift``{{execute}}

There's a lot that happens here so lets break it down:

The `mvn package` piece of the above command instructs Maven to run the package lifecycle. This builds a Spring Boot JAR file which is a Fat Jar containing all dependencies necessary to run our application.

For the deployment to OpenShift we are using the [Fabric8](https://fabric8.io/) tool through the `fabric8-maven-plugin` which is configured in our ``pom.xml``{{open}} (found in the `<profiles/>` section). Configuration files for Fabric8 are contained in the ``src/main/fabric8``{{open}} folder mentioned earlier.

This step may take some time to do the Maven build and the OpenShift deployment. After the build completes you can verify that everything is started by running the following command:

``oc rollout status dc/rhoar-training-sso``{{execute}}

You should see output in the console similar to `replication controller "rhoar-training-sso" successfully rolled out`. Then you can either go to the OpenShift web console and click on the route or click [here](http://rhoar-training-dev.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/fruits). You should see the same page as before only this time it's coming from the application hosted on OpenShift!

Click on the `Secured Resource` link and you should be directed to keycloak for login.  Enter `user1` as the username and `password` as the password and you should be directed to the secured view of the application. Clicking the `logout` link will bring you back to the unsecured view of the application.

## Congratulations

You have now learned how to deploy a Spring Boot MVC application to OpenShift Container Platform. 

Click Summary for more details and suggested next steps.
