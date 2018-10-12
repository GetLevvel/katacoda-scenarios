# Deploy and Configure Keycloak

In this step you will deploy and configure Keycloak. 

**1. Login to the OpenShift Container Platform**

To login, we will use the `oc` command and then specify a username and password like this:

``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

>**IMPORTANT:** If the above `oc login` command doesn't seem to do anything, you may have forgotten to stop the application from the previous step. Click on the terminal and press **CTRL-C** to stop the application and try the above `oc login` command again!

Next we create the project that we'll be adding our application to:

``oc new-project dev --display-name="Dev - Spring Boot App"``{{execute}}

Next we create a template for PostgeSQL
``oc create -f ./src/main/fabric8/postgresql.json``{{execute}}

You should see `template "postgresql-for-keycloak" created` as output.

Next we create an application for PostgeSQL
``oc new-app postgresql-for-keycloak``{{execute}}

You should see the following output:

`Deploying template "dev/postgresql-for-keycloak" to project dev`
	
	`postgresql-for-keycloak
	---------
	PostgreSQL on OpenShift for Keycloak`

--> Creating resources ...
    service "postgres" created
    pod "postgres" created
--> Success`


Next we create a template for Keycloak
``oc create -f ./src/main/fabric8/keycloak.json``{{execute}}

You should see `template "keycloak-server" created` as output.

Next we create an application for Keycloak
``oc new-app keycloak-server``{{execute}}


You should see the following output:
``Deploying template "dev/keycloak-server" to project dev

     keycloak-server
     ---------
     Keycloak

--> Creating resources ...
    deploymentconfig "keycloak-server" created
    service "keycloak" created
    route "keycloak" created
--> Success``



**3. Open the OpenShift Web Console**

OpenShift ships with a web-based console that will allow users to
perform various tasks via a browser. To get a feel for how the web console
works, click on the "OpenShift Console" tab next to the "Local Web Browser" tab. The login credentials are the ones used in the `oc login` command: developer/developer.

![OpenShift Console Tab](../../assetsmiddleware/rhoar-getting-started-spring/openshift-console-tab.png)

The first screen you will see is the authentication screen. Enter the developer username and password used before and 
then login:

![Web Console Login](../../assetsmiddleware/rhoar-getting-started-spring/login.png)

After you have authenticated to the web console you will be presented with a list of projects that your user has permission to view.

![Web Console Projects](../../assetsmiddleware/rhoar-getting-started-spring/projects.png)

Click on your new project to be taken to the project overview page which will list all of the routes, services, deployments, and pods that you have created as part of your project:

![Web Console Overview](../../assetsmiddleware/rhoar-getting-started-spring/overview.png)

There's nothing there now, but that's about to change.

## Congratulations

You have now learned how to access your OpenShift environment. In next step we will deploy our application to the OpenShift Container Platform.