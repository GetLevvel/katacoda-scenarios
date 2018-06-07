# Login and Deploy to OpenShift Container Platform

**Red Hat OpenShift Container Platform** is the preferred runtime for **Red Hat OpenShift Application Runtimes** like **Spring Boot**, **Vert.x**, etc. The OpenShift Container Platform is based on **Kubernetes** which is a Container Orchestrator that has grown in popularity and adoption over the last couple years. **OpenShift** is currently the only container platform based on Kubernetes that offers multitenancy. This means that developers can have their own personal, isolated projects to test and verify applications before committing to a shared code repository.

OpenShift also ships with a feature rich web console as well as command line tools to provide users with a friendly interface to work with applications deployed to the platform. 

**1. Login to the OpenShift Container Platform**

To login, we will use the `oc` command with the developer credentials:

``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

>**IMPORTANT:** If the above `oc login` command doesn't seem to do anything, you may have forgotten to stop the application from the previous step. Click on the terminal and press **CTRL-C** to stop the application and try the above `oc login` command again!

Then we'll create the project:

``oc new-project dev --display-name="Dev - Spring Boot App"``{{execute}}

Now create a database:

``oc new-app -e POSTGRESQL_USER=dev -e POSTGRESQL_PASSWORD=secret -e POSTGRESQL_DATABASE=my_data openshift/postgresql-92-centos7 --name=my-database``{{execute}}

All that's left is to run the following command to deploy the application to OpenShift:

``mvn verify -Popenshift,openshift-it -Denv.init.enabled=true -DenableImageStreamDetection=true``{{execute}}

After it's complete we can either go to the OpenShift web console and click on the route or click [here](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/api/fruits). You should see the same JSON output as the previous step:

```json
[{"name":"Cherry"},{"name":"Apple"},{"name":"Banana"}]
```
And if you open the [web application](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) the same functionality from the previous steps should still work.

## Congratulations

You have now learned how to perform an integration test using Arquillian on OpenShift Container Platform. 

Click Summary for more details and suggested next steps.



-Dnamespace.use.existing=myproject -Denv.init.enabled=true works