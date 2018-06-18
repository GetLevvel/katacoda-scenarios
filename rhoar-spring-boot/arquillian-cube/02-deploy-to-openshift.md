# Login and Deploy to OpenShift Container Platform

Now it's time for the fun! The following steps will walk you through deploying the application to OpenShift and running the tests with Arquillian Cube.


**1. Setup OpenShift**

Login to OpenShift using the `oc` command with the developer credentials:

``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

>**IMPORTANT:** If the above `oc login` command doesn't seem to do anything, you may have forgotten to stop the application from the previous step. Click on the terminal and press **CTRL-C** to stop the application and try the above `oc login` command again!

Then we'll create the project:

``oc new-project fruit --display-name="Dev - Fruity App"``{{execute}}

Now create a database:

``oc new-app -e POSTGRESQL_USER=dev -e POSTGRESQL_PASSWORD=secret -e POSTGRESQL_DATABASE=my_data openshift/postgresql-92-centos7 --name=my-database``{{execute}}


**2. Run the integration tests**
Run the following command to deploy the application to OpenShift and run the integration tests:

``mvn clean package -Popenshift``{{execute}}

>**NOTE:** The building, deploying, and testing of the application may take a few minutes


## Congratulations

You have now learned how to run an integration test using Arquillian Cube on OpenShift! In the next step you will add a test scenario!