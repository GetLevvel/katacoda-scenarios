**Deploy to OpenShift**

First, we need a database.

Deploy the database in OpenShift using:

``cd /root/code/audit-service``{{execute}}

``oc new-app -e POSTGRESQL_USER=admin -ePOSTGRESQL_PASSWORD=secret -ePOSTGRESQL_DATABASE=audit registry.access.redhat.com/rhscl/postgresql-94-rhel7 --name=audit-database``{{execute}}

It creates a new database service named ``audit-database`` with the given credentials and settings. Be aware that for sake of simplicity this database is not using a persistent storage.

Now, we can deploy our audit service:

``mvn fabric8:deploy``{{execute}}

Refresh the dashboard, and you should see the operations in the top right corner!
