# Deploy to OpenShift Application Platform with Launcher

Now that we have our working application set up locally, we want to deploy it on the OpenShift Platform. One of the easiest ways is to use the built in S2I tool.

**1. Create Git Repository**

In order to use the Source-To-Image (S2I) process, the only thing that's required is a project name and a Git Repository. Covering Git is outside the scope of this training, but we want to initialize a Git repository at our base folder and push the project to our remote repository. After that's done, make sure to have your github repository URL handy.

**2. Deploy the application to OpenShift**

Log in to the OpenShift Web Console with the following credentials:

username: `developer` 
password: `developer`

Then click on the `Add to Project` button:

![Add to Project](../../assets/middleware/rhoar-creating-applications-for-cloud/add-project-start-button.png)

Use any name for the project name and display name:

![Create Project](../../assets/middleware/rhoar-creating-applications-for-cloud/create-project.png)

After clicking the create button you're brought to the `Add to Project` screen under the `Browse Catalog` tab:

![Browse Catalog](../../assets/middleware/rhoar-creating-applications-for-cloud/browse-catalog.png)

Since we're using Java with Spring, we're going to click the `Java` button. Next we'll see a list of application servers (currently only Wildfly) to pick from. Select Wildfly:

![Wildfly](../../assets/middleware/rhoar-creating-applications-for-cloud/wildfly.png) 

Now it will prompt us for our Github repository URL. Paste it in the box and continue:

![Input Repo](../../assets/middleware/rhoar-creating-applications-for-cloud/input-repo.png) 

That's it! After a few moments we'll be shown this confirmation screen, telling us that the application has been created and is in the build process:

![Continue to Overview](../../assets/middleware/rhoar-creating-applications-for-cloud/continue-to-overview.png) 

Go to overview and you'll see your application in the process of building. Once it's complete it'll show you a Route that you're able to hit and see your application live. That's all there is to it!

## Congratulations

You have now learned how to deploy a Spring Boot application to OpenShift Container Platform through the Source-To-Image (S2I) process.
