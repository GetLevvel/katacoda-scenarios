The law is the law. The Sarbanes–Oxley Act requires you to keep a track of every transaction you do on a financial market. The audit service records the shares you buy and sell in a database. It’s going to be a PostGreSQL database, but is would be similar with another database, even no-sql database. The database is going to be deployed in OpenShift.
 
In this chapter we are going to cover: * advanced asynchronous orchestration * asynchronous JDBC * Vert.x Web to build REST API * Managing secrets with OpenShift

**1. Accessing data asynchronously**

As said previously, Vert.x is asynchronous and you must never block the event loop. And you know what’s definitely blocking ? Database accesses and more particularly JDBC! Fortunately, Vert.x provides a JDBC client that is asynchronous.

The principle is simple (and is applied to all clients accessing blocking systems):

However, interactions with databases are rarely a single operation, but a composition of operations. For example:

1. Get a connection
2. Drop some tables
3. Create some tables
4. Close the connection

**2. The Audit service**

The Audit service:

1. Listens for the financial operations on the event bus
2. Stores the received operations in a database
3. Exposes a REST API to get the last 10 operations

Interactions with the database use the ``vertx-jdbc-client``, an async version of JDBC. So expect to see some SQL code (I know you love it). But, to orchestrate all these asynchronous calls, we need the right weapons. We are going to use RX Java 2 for this.