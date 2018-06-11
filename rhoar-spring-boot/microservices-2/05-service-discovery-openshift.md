# Spring Cloud Kubernetes DiscoveryClient

**Deploy to OpenShift**
``oc login [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true -u developer -p developer``{{execute}}

``oc new-project fruits --display-name="Dev - Spring Boot App"``{{execute}}

``oc create -f ./service.json``{{execute}}

open ``eureka-client/pom.xml``{{open}}
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

``cd ./eureka-client``{{execute}}

``mvn package -Dfabric8.openshift.trimImageInContainerSpec fabric8:deploy -Popenshift``{{execute}}

``discovery-service-fruits.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com``
