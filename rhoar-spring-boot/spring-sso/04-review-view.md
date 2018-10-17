# Review the Home View



There are a number of View libraries supported by Spring MVC. One that has gained a lot of popularity and support is [Thymeleaf](https://www.thymeleaf.org/). Thymeleaf is often considered a HTML extension as Thymeleaf views are HTML with a couple of Thymeleaf attributes added. The benefit of this over something like JSPs is that Thymeleaf views still open in Web Browsers without the need for a running server. While this won't be a full in-depth overview of Thymeleaf we will cover some of the basics.

For our application we will use Thymeleaf. We already added the Spring Boot Starter POM for Thymeleaf in the first step. Spring Boot has a convention for Thymeleaf views: if a Thymeleaf View resides in the `src/main/resources/templates` folder it will automatically register that View for us. We have added a couple of views for our application. The `external` view is for unsecured access and the `secured` view is for the view that is going to be secured by Keycloak. 

Let's open that view: `src/main/resources/templates/external.html`{{open}}

The first thing to notice in this file is the `<html xmlns:th="http://www.thymeleaf.org">` tag. The `xmlns:th` describes the Thymeleaf namespace and assigns it to the `th` prefix. This gives us access to the Thymeleaf tag attributes.

We then skip down to the secured resource section: `<a th:href="@{/secured}">Click Here</a>`. As you can see this is a standard HTML hyperlink `<a>` with a Thymeleaf attribute added.

Using the `th:href` Thymeleaf attribute with what is known as a [Link Expression](https://www.thymeleaf.org/doc/articles/standarddialect5minutes.html#link-url-expressions) (the `"@{/secured}` bit) we can create a context-independent hyperlink from this view to our secured view.


Now open that secured view: `src/main/resources/templates/secured.html`{{open}}

This uses the `th:text` Thymeleaf attribute to print the username.

```
<div id="container">
    <h1>
        Hello, <span th:text="${username}">--name--</span>.
    </h1>
</div>
```

## Congratulations

Now you've seen how to get started with Thymeleaf as a View library for a Spring MVC application. There are so many other concepts to explore with Thymeleaf and we've only scratched the surface here. 