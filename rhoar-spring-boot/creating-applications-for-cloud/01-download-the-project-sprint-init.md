# Overview

When developing a Spring application a great place to start is with the [Spring Initializr](https://start.spring.io) tool. The website will allow you to select from a few simple settings and choose different libraries to include to help you get started with a skeleton Spring application that's ready to go!


**1. Spring Initializr** 
Go ahead and navigate to the [Spring Initializr](https://start.spring.io) tool. The first thing you'll see is a simple tool for generating Spring applications. This tool is very useful for getting a Spring Boot application up and running very quickly, including whatever dependencies you need. To take a look at all of the dependencies, switch your view to the full version by clicking the link: 

![Full Version](../../assets/middleware/rhoar-creating-applications-for-cloud/full-version.png)

Scrolling down we can start to see a number of libraries separated by categories. There are `SQL`, `Web`, `Integration`, and plenty of `Cloud` libraries that we can automatically include in our pom file by checking whichever boxes we want.

>**NOTE:** We're going to avoid downloading an application from Spring Initializr for simplicity's sake. But feel free to create a project and include some libraries and take a look at the fully generated project. We're going to be creating a very similar project in the next step.

If we wanted to generate a project it's as easy as choosing the specific dependencies we wanted (from either the dropdown or manually checking the boxes) and clicking the `Generate Project` button. This will give us a zip file for download that contains our application.

## Congratulations

You have now successfully executed the first step in this scenario and familiarized yourself with the Spring Initializr tool, which will prove to be very useful in the future. In next step we will go over one option to deploy our application to the OpenShift Container Platform.