Now that the service implementation is complete, let’s publish it ! First we need a verticle that creates the actual service object, registers the service on the event bus and publishes the service in the service discovery infrastructure.

Open the Open the file in the editor: ``portfolio-service/src/main/java/io/vertx/workshop/portfolio/impl/PortfolioVerticle.java``{{open}}

In its start method is does what we just say:

1) Create the service object with:

Copy the below content to the matching `TODO` statement (or use the `Copy to Editor` button):

<pre class="file" data-filename="src/main/java/io/vertx/workshop/portfolio/impl/PortfolioVerticle.java" data-target="insert" data-marker="//TODO: create portfolio service">
PortfolioServiceImpl service = new PortfolioServiceImpl(vertx, discovery, config().getDouble("money", 10000.00));
</pre>

2) Register it on the event bus using the ProxyHelper class:

<pre class="file" data-filename="src/main/java/io/vertx/workshop/portfolio/impl/PortfolioVerticle.java" data-target="insert" data-marker="//TODO: register portfolio service">
ProxyHelper.registerService(PortfolioService.class, vertx, service, ADDRESS);
</pre>

3) Publish the service in the service discovery infrastructure to make it discoverable:

<pre class="file" data-filename="src/main/java/io/vertx/workshop/portfolio/impl/PortfolioVerticle.java" data-target="insert" data-marker="//TODO: publish portfolio service">
publishEventBusService("portfolio", ADDRESS, PortfolioService.class, ar -> {
  if (ar.failed()) {
    ar.cause().printStackTrace();
  } else {
    System.out.println("Portfolio service published : " + ar.succeeded());
  }
});
</pre>

4) The publishEventBusService is implemented as follows:
   
```java
// Create the service record:
Record record = EventBusService.createRecord(name, address, serviceClass);
// Publish it using the service discovery
discovery.publish(record, ar -> {
  if (ar.succeeded()) {
    registeredRecords.add(record);
    completionHandler.handle(Future.succeededFuture());
  } else {
    completionHandler.handle(Future.failedFuture(ar.cause()));
  }
});
```

Are we done ? No…​. We have a second service to publish. Remember, we are also sending messages on the event bus when we buy or sell shares. This is also a service (a message source service to be exact).

At the end of the ``start`` method, write the code required to publish the ``portfolio-events`` service. ``EVENT_ADDRESS`` is the event bus address.

<pre class="file" data-filename="src/main/java/io/vertx/workshop/portfolio/impl/PortfolioVerticle.java" data-target="insert" data-marker="//TODO: publish portfolio-events service">
publishMessageSource("portfolio-events", EVENT_ADDRESS, ar -> {
  if (ar.failed()) {
    ar.cause().printStackTrace();
  } else {
    System.out.println("Portfolio Events service published : " + ar.succeeded());
  }
});
</pre>

Now we are done, and it’s time to build and run this service.