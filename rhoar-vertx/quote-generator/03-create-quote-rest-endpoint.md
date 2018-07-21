# The quote REST endpoint

Open the `RestQuoteAPIVerticle`. This verticle exposes a HTTP endpoint to retrieve the current / last values of the maker data (quotes). In the `start` method you need to:

* Receive the event bus market messages to collect the last quotations (in the quotes map)
* Handle HTTP requests to return the list of quotes or a single quote if the name (query) param is set.

In this example we are using streams (Flowable). Streams are an important part of reactive programming and architecture. 

Let’s do that…​.

**1. Task - Implementing a Handler to receive events**

The first action is about observing the stream of market messages. This is done using vertx.eventBus().<JsonObject>consumer(GeneratorConfigVerticle.ADDRESS).toFlowable(). We now have the stream of messages, but we need to extract the JSON body and populate the quotes map. Implement the missing logic that extracts the body of the message (with the body() method), and then puts name → quote in the quotes map.

Open the file in the editor: ``quote-generator/src/main/java/io/vertx/workshop/quote/RestQuoteAPIVerticle.java``{{open}}
Then, copy the below content to the matching `TODO` statements(or use the `Copy to Editor` button):
      
Extract the body of the message

<pre class="file" data-filename="src/main/java/io/vertx/workshop/quote/RestQuoteAPIVerticle.java" data-target="insert" data-marker="// TODO: Extract the body of the message">
.map(Message::body)  
</pre>

Populate the quotes map

<pre class="file" data-filename="src/main/java/io/vertx/workshop/quote/RestQuoteAPIVerticle.java" data-target="insert" data-marker="// TODO: For each message, populate the quotes map with the received quote.">
.doOnNext(json -> {
    quotes.put(json.getString("name"), json); // 2
})
</pre>

**2. Task - Implementing a Handler to handle HTTP requests**

Now that you have the quotes, let’s use them to handle HTTP requests. The code already creates the HTTP server and provides the stream of HTTP requests. The stream emits an item for every HTTP request received by the server. So, you need to handle the request and write the response.

Write the content of the request handler to respond to the request:

1. a response with the content-type header set to application/json (already done)
2. retrieve the name parameter (it’s the company name)
3. if the company name is not set, return all the quotes as json.

if the company name is set, return the stored quote or a 404 response if the company is unknown
Copy the following to the matching `TODO` statement

<pre class="file" data-filename="src/main/java/io/vertx/workshop/quote/RestQuoteAPIVerticle.java" data-target="insert" data-marker="// TODO: Handle the HTTP request">
String company = request.getParam("name");
if (company == null) {
    String content = Json.encodePrettily(quotes);
    response.end(content);
} else {
    JsonObject quote = quotes.get(company);
    if (quote == null) {
        response.setStatusCode(404).end();
    } else {
        response.end(quote.encodePrettily());
    }
}
</pre>

1. Get the response object from the request
2. Gets the name parameter (query parameter)
3. Encode the map to JSON
4. Write the response and flush it using end(…​)
5. If the given name does not match a company, set the status code to 404

You may wonder why synchronization is not required. Indeed we write in the map and read from it without any synchronization constructs. Here is one of the main feature of Vert.x: all this code is going to be executed by the same event loop, so it’s always accessed by the same thread, never concurrently.

**3. Test our changes**

First, let’s build the microservice. In the terminal, execute:

``mvn clean compile vertx:run``{{execute}}

This command launches the application. The main class we used creates a clustered Vert.x instance and reads the configuration from src/conf/config.json. This configuration provides the HTTP port on which the REST service is published (35000).

Click on the [this](https://[[HOST_SUBDOMAIN]]-35000-[[KATACODA_HOST]].environments.katacoda.com/) link, which will open another tab or window of your browser pointing to port 35000 on your client.

You should now see an HTML page that looks like this:

```json

{
  "MacroHard" : {
    "volume" : 100000,
    "shares" : 51351,
    "symbol" : "MCH",
    "name" : "MacroHard",
    "ask" : 655.0,
    "bid" : 666.0,
    "open" : 600.0
  },
  "Black Coat" : {
    "volume" : 90000,
    "shares" : 45889,
    "symbol" : "BCT",
    "name" : "Black Coat",
    "ask" : 654.0,
    "bid" : 641.0,
    "open" : 300.0
  },
  "Divinator" : {
    "volume" : 500000,
    "shares" : 251415,
    "symbol" : "DVN",
    "name" : "Divinator",
    "ask" : 877.0,
    "bid" : 868.0,
    "open" : 800.0
  }
}
```

It gives the current details of each quotes. The data is updated every 3 seconds, so refresh your browser to get the latest data.


**4. Test the dashboard**

Let’s now launch the dashboard. 

**Open another terminal and execute**

``cd /root/code/micro-trader-dashboard``{{execute}}

``mvn clean compile vertx:run``{{execute}}

Then, open your browser to [this](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) link, which will open another tab or window of your browser pointing to port 8080 on your client.

Some parts have no content, and it’s expected as it’s just the beginning…​

**5. Stop the application**

Before moving on, press CTRL-C to stop the dashboard. Then switch back to the 1st terminal and press CTRL-C to stop the running application!

## Congratulations!
You have seen the basics of Vert.x development including Asynchronous API and AsyncResult, implementing Handler and receiving messages from the event bus

In next step of this scenario we will deploy our application to the OpenShift Container Platform.