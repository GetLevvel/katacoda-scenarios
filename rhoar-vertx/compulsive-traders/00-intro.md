**The compulsive traders**

Let’s rewind a bit to have a better view of the current status. In the quote-generator we have build a verticle sending market data to the event bus. In the portfolio service, we expose an event bus service to manage our portfolio. Traders are the missing link between both. It implement the logic deciding when to buy and sell stocks. Traders have only one goal: getting rich (or not…​)!

In this section, we are going to develop 3 traders (following a stupid logic you can definitely improve):

* The first trader is developed with the raw Vert.x API (callbacks)

* The second trader is developer with RX Java 2 (reactive programming)

* The third trader is developed with Kotlin using co-routine

It gives you an overview of the different programming style proposed by Vert.x, and let you decide which one you prefer. Also notice that Vert.x supports JavaScript, Groovy, Ruby, Scala and Ceylon.

**Compulsive and dumb traders**

Before seeing how these are implemented, let’s explain the absolutely illogic algorithm used by these traders:

A compulsive trader is choosing one company name and a number of shares (x)

Randomly, it tries to buy or sell x shares of the company

It does not check whether or not it has enough shares or money, it just tries…​ This logic is implemented in ``io.vertx.workshop.trader.impl.TraderUtils``.