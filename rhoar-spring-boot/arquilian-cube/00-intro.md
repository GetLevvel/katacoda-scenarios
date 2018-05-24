In this scenario you will learn more about developing Spring Boot applications using the [Red Hat OpenShift Application Runtimes](https://developers.redhat.com/products/rhoar) platform. 

TODO module description

## How is Spring Boot supported on OpenShift?

Spring is one of the most popular Java Frameworks and offers an alternative to the Java EE programming model. Spring is also very popular for building applications based on Microservices Architecture due to its support for packaging applications into self-contained, deployable JAR files. For web applications Spring Boot can embed a Servlet Container like Apache Tomcat to create a completely self-sufficient JAR file which can be deployed and run without any external tools (other than the Java Runtime of course!). These bootable applications (sometimes also called fat JARs or über JARs) fit the container model very well since in a container platform like OpenShift responsibilities like starting, stopping and monitoring applications are then handled by the container platform instead of an Application Server. And since you are deploying a single JAR file the container definition is also much simpler.

Red Hat tests and certifies a certain version of Spring and Spring Boot for usage on the OpenShift platform as part of Red Hat OpenShift Application Runtimes. Red Hat also provides full support for Apache Tomcat, Hibernate and Apache CXF (for REST services) when used in a Spring Boot application on OpenShift Application Runtimes.
