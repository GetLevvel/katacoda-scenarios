# Spring Cloud Kubernetes DiscoveryClient

OpenShift provides its own load balancing and service discovery so we do not need to use Eureka when we deploy to OpenShift.  

**Create Service**

First login in to openshift and create a project.

``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

``oc new-project fruits --display-name="Dev - Spring Boot App"``{{execute}}

Next we will need to create a service. Take a look at ``service.json``{{open}}. Here is where we define our service. Notice the `selector` field in particular. This is how we define which pods we should add to this service. The selector references a label that we will apply to each pod we want to use with this service. 

```json
"spec": {
    "selector": {
      "name":"auto-discover"
    },
```

Now create the service with the below command and expose the route. 
    
``oc create -f ./service.json``{{execute}}

``oc expose service/discovery-service``{{execute}}

We can check the status of the service at any time by using the below command

``oc describe service discovery-service``{{execute}}

In the output you will see that there are currently no endpoints defined for this service. That will soon change. 

`Endpoints:              <none>`

**Deploy Application**

Next we will modify the client applications `pom.xml` to include a label. Notice that the label is the same as the one defined in the selector in the service definition above. Open ``eureka-client/pom.xml``{{open}}

<pre class="file" data-filename="eureka-client/pom.xml" data-target="insert" data-marker="<!-- TODO: Add label here-->">
    &lt;configuration&gt;
        &lt;resources&gt;
            &lt;labels&gt; 
              &lt;all&gt; 
                &lt;property&gt; 
                  &lt;name&gt;name&lt;/name&gt;
                  &lt;value&gt;auto-discover&lt;/value&gt;
                &lt;/property&gt;
              &lt;/all&gt;
            &lt;/labels&gt;
        &lt;/resources&gt;
    &lt;/configuration&gt;
</pre>

Deploy the client application to OpenShift.

``cd ./eureka-client``{{execute}}

``mvn package -Dfabric8.openshift.trimImageInContainerSpec fabric8:deploy -Popenshift``{{execute}}

Check that the pod has been added to the service we created earlier. 

``oc describe service discovery-service``{{execute}}

You should now see that an endpoint has been added to the service. Navigate to the project in OpenShift [here](http://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/fruits/overview) or by clicking the **OpenShift Console** tab. Increase the number of pods deployed to 2 and run the above command again. You should now see that the service has two endpoints. 

The service will now automatically route to and perform load balancing for these two endpoints.


<!-- [here](http://discovery-service-fruits.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com) -->
