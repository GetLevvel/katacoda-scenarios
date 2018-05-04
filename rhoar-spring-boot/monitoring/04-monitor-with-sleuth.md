# Additional Monitoring

Our health check is nice to determine if our application is online and healthy but it would be nice if we had some additional tools for debugging and monitoring our application. For that, we're going to be using a Spring library known as `Spring Cloud Sleuth`, a tracing tool that will assist in our logging.

**1. Sleuth and Tracing**

Spring Cloud Sleuth is a project that was created to help developers track flows as requests travel throughout their systems. Sleuth uses similar terminology to Dapper, but we'll go over a quick overview to make sure we're all on the same page.

The concept of Tracing is simple; track a request as it passes through our system and periodically log the request so we can see if/when the request became corrupted. If we log at every entry and exit point of all of our components we can greatly decrease the time spent debugging. We're able to very quickly narrow down where and when the application entered a failure state.

If we were to have a request that went through multiple services and was then returned, that entire lifecycle would be the full `trace`. As it passes through the different entry and exit points it enters a new `span` of its lifecycle, which is why we call those `Spans`. Since a single `trace` can have multiple `spans`, we create a single `traceID` for our component but multiple `spanIDs`, depending on the span that it's currently in.

**2. Add basic logging**
Luckily for us Sleuth handles all of these complexities! All we have to do is include the library in our project and we're good to go! To include Sleuth we have to add the required dependency to our pom file:
``pom.xml``{{open}}
<pre class="file" data-filename="pom.xml" data-target="insert" data-marker="<!-- TODO: Add Sleuth dependency here -->">
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
      &lt;artifactId&gt;spring-cloud-starter-sleuth&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>

Now that we have our dependency set up, we're going to add some basic logging. Let's add an info-level log to our main controller:
``src/main/java/com/example/service/HomeController.java``{{open}}

<pre class="file" data-filename="src/main/java/com/example/service/HomeController.java" data-target="insert" data-marker="// TODO: Add Sleuth logging here">
log.info("Entering application");
logMessage();
</pre>

We're also going to add another function that only contains a logging statement that we're calling in our main controller function:
``src/main/java/com/example/service/HomeController.java``{{open}}

<pre class="file" data-filename="src/main/java/com/example/service/HomeController.java" data-target="insert" data-marker="//TODO: Add blank logging function">
public void logMessage() {
    log.info("Logging from function");
}
</pre>

**3. Build locally**

Now that we have both of our log statements created, let's test it out! We're going to build our application locally so we can easily take a look at the logs:

``mvn spring-boot:run``{{execute}}

Now we can click [here](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) or on the `Local Web Browser` tab to pull up the local project. After we hit the main page and see the success screen, take another look at the terminal. We should see two logging statements that look similar to this:

`INFO [-,66221df6b307bf1a,66221df6b307bf1a,false] 2588 --- [nio-8080-exec-1] com.example.service.HomeController       : Entering Application`

`INFO [-,66221df6b307bf1a,66221df6b307bf1a,false] 2588 --- [nio-8080-exec-1] com.example.service.HomeController       : Logging from function`

Not only do we see the log message that we created, we also see a lot of additional info. Let's break it down.

The first number that we see is the `traceID`. That's the ID that's used throughout the entire request and is unique to this specific trace. The second number is the `spanID`, which tells us which span we're currently in on the full trace. So our logging messages follow this format:

`<LOG_TYPE> [<TRACE_ID>, <SPAN_ID>] <CLASS>: <MESSAGE>`

For us both of our values are the same, but if we were to create additional spans manually we would see different `spanID`s while keeping the same `traceID`. We can also see that both of our log messages have the same value since they were both called within the same trace and span. If we refresh our main page, we will see the same two messages but both with different trace and span ids.

## Congratulations

We've now added Sleuth to our application, allowing us to quickly and easily monitor and debug our application by including however much logging we think is reasonable. You can view the Github profile and readme for Sleuth [here](https://github.com/spring-cloud/spring-cloud-sleuth). 