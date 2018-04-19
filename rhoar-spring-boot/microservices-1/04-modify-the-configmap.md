# Making modifications to the Configuration Map

**1. Modify the ConfigMap**

Let's modify the greeting that our service is returning to the user. Since we set up the greeting in a properties file, we will not need to make any code change to change the functionality. This means that we won't need to have any downtime for this change, we're able to modify the response through our newly created configmap from the previous step. We can pull up our ConfigMap with this command:

``oc edit configmap app-config``{{execute}}

This will open the file in a vim editor. Let's change the greeting to something like this:

`greeting.message=Bonjour %s from a ConfigMap!`

Now in order to reflect those changes, we deploy the new version of the application so the ConfigMap configuration changes are picked up:

``oc rollout latest dc/spring-boot-configmap-greeting``{{execute}}

That's all there is to it!

**2. Test changes**

Now that we've modified the ConfigMap and deployed our changes, let's test the greeting service and see if it's returning our new value.
Put in a test value and click the button. Now instead of seeing `Hello <name>...`, we should be seeing: 

`Bonjour %s from a ConfigMap!`

<!-- `Bonjour <name>...`! 

![Bonjour Message](../../assets/middleware/rhoar-microservices/bonjour-message-minier.png) -->

This means that we were able to modify our application behavoir through External Configuration of the `application.properties` file using a ConfigMap without having to even take down the application. That's pretty powerful!

## Congratulations

You have now learned how to handle Externalized Configuration with ConfigMaps through OpenShift. By creating a configmap, we're able to modify application properties on the fly and simply rollout the new changes to our application.