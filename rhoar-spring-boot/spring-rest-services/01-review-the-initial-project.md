# Get project set up

**1. Adding Spring MVC and Tomcat to the application**

Since our application will be a web application we need to use a servlet container like Apache Tomcat or Undertow to handle incoming connections from clients. Since Red Hat offers support for Apache Tomcat (e.g., security patches, bug fixes, etc.) we will use it here. 

>**NOTE:** Undertow is another an open source project that is maintained by Red Hat and therefore Red Hat plans to add support for Undertow shortly.

In addition we are going to utilize the Spring MVC project which contains many of the abstractions we will use to build our APIs. To add these dependencies to our project add the following lines in the ``pom.xml``{{open}} (If you left the TODO comments in you can click the `Copy to Editor` button to do this automatically)

<pre class="file" data-filename="pom.xml" data-target="insert" data-marker="<!-- TODO Add Web depenedency here -->">
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
      &lt;artifactId&gt;spring-boot-starter-web&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>

You may notice that there is no `<version>` tag here. That's because the version numbers are managed and automatically derived by the BOM mentioned in previous trainings. 

**2. Test the application locally**

Run the application by executing the following command (it should exit automatically as we do not have any web code yet):

``mvn spring-boot:run``{{execute}}

You should eventually see a log line like `Started Application in 4.497 seconds (JVM running for 9.785)`. Then stop the application by pressing **Ctrl+C**.

## Congratulations

You have now successfully executed the first step in this scenario. 