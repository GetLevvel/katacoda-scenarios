# Review the base structure of the application

For your convenience, this scenario has been created with a base project using the Java programming language and the Apache Maven build tool. The base project contains an application 
with unprotected resources.

This project already includes everything you need. Start by reviewing the base project's content by executing a ``tree``{{execute}} in your terminal.

The output should look something like this:

```sh
.
├── pom.xml
└── src
    ├── main
    │   ├── fabric8
    │   │   ├── deployment.yml
    │   │   └── route.yml
    │   │   └── credentials-secret.yml
    │   │   └── keycloak.json
    │   │   └── postgresql.json
    │   ├── java
    │   │   └── com
    │   │       └── example
    │   │           └── Application.java
    |	|			└──service
    |	|           	└── Fruit.java
    |	|               └── FruitController.java
    |	|               └── FruitRepository.java
    │   └── resources
    │       └── static
    │           └── index.html
 	│       └── templates
    │           └── error.html
    │           └── home.html
    └── test
        └── java
```


Except for the `fabric8` directory and the `index.html`, this matches what you would get if you generated an empty project using the [Spring Initializr](https://start.spring.io). For the moment you can ignore the content of the fabric8 folder (we will discuss this later).

One thing that differs slightly is the ``pom.xml``{{open}} file.

As you review the content, you will notice that there are a couple **TODO** comments. **Do not remove them!** These comments are used as markers for later exercises in this scenario. 

Notice that the Keycloak adapter BOM (Bill of materials ) and Keycloak Adapter dependency has already been configured. We use this BOM to make sure we are using the dependency versions supported by Red Hat.

```xml
<dependencyManagement>
	<dependencies>
      <dependency>
		<groupId>org.keycloak.bom</groupId> 
        <artifactId>keycloak-adapter-bom</artifactId> 
        <version>${version.org.keycloak.bom.keycloak-adapter-bom>}</version> 
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
</dependencyManagement>
```

```xml
  ...
    <dependencies>
    ...
      <dependency>
        <<groupId>org.keycloak</groupId>
        <artifactId>keycloak-spring-boot-starter</artifactId> 
      </dependency>
      ...
    </dependencies>
  ...
```

**1. Test the application locally**

As we develop the application we want to be able to test and verify our change at different stages. One way we can do that locally is by using the `spring-boot` maven plugin.

Run the application by executing the following command:

``mvn spring-boot:run``{{execute}}

>**NOTE:** The Katacoda terminal window is like your local terminal. Everything that you run here you should be able to execute on your local computer as long as you have `Java SDK 1.8` and `Maven` installed. In later steps, we will also use the `oc` command line tool for OpenShift commands.

**2. Verify the application**

You will eventually see a output similar to `Started Application in 4.497 seconds (JVM running for 9.785)`. Open the application by clicking on the **Local Web Browser** tab or clicking [here](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/).

You should now see an HTML page with the `Welcome to Spring Boot` welcome message. If you see this then you've successfully set up the application! If not check the logs in the terminal. Spring Boot adds helper layers to catch common errors and print helpful messages to the console.

*Notice you didn't need to login?*


**4. Stop the application**

Before moving on, click in the terminal window and then press `ctrl-c`.


## Congratulations

You have now successfully executed the first step in this scenario. In the next step we will 

