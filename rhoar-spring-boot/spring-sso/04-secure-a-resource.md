# Add the Model and Controller

Spring MVC is a framework around the Model/View/Controller pattern which provides the developer with a set of tools and abstractions for building MVC-driven applications. 

**1. Add a Controller**

To make these models available to our application we need to create a Spring Controller. Controllers are the **C** in the MVC pattern which mediate between our views and our internal models / business logic. Here we need to create a Spring `@Controller` annotated Java class. For this you need to click on the following link which will open an empty file in the editor: ``src/main/java/com/example/service/WebController.java``{{open}}

Then copy the below content into the file (or use the `Copy to Editor` button):

<pre class="file" data-filename="src/main/java/com/example/service/WebController.java" data-target="replace">
package com.example.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;
import java.security.Principal;
import org.keycloak.common.util.KeycloakUriBuilder;
import org.keycloak.constants.ServiceUrlConstants;

@Controller
public class WebController {
	
	private @Autowired HttpServletRequest request;

    @GetMapping(path = "/")
    public String handleExternal() {
        return "external";
    }

    @GetMapping(path = "/secured")
    public String handleSecured(Principal principal, Model model) {
        model.addAttribute("username", principal.getName());
		
	    String keyCloakAuthUrl = System.getenv("KEYCLOAK_AUTH_SERVER_URL");
	    String hostname = "http://" + System.getenv("HOSTNAME") + ":8080/external";
		
        String logoutUri = KeycloakUriBuilder.fromUri(keyCloakAuthUrl).
            path(ServiceUrlConstants.TOKEN_SERVICE_LOGOUT_PATH).
		    queryParam("redirect_uri", hostname).build("quickstart").toString();
	   		
        model.addAttribute("logout",  logoutUri);
        return "secured";
    }
    
    @GetMapping(value = "/logout")
    public String handleLogout() throws ServletException {
        request.logout();
        return "external";
    }
}
</pre>

The `@Controller` annotation is a Spring annotation which marks the annotated class as, you guessed it, a Controller. Spring Boot will search for these annotations (and others) at startup and automatically wire them up to the Servlet Container for use. 

`@GetMapping` is a special form of `@RequestMapping`. It's actually short-hand for `@RequestMapping(method = RequestMethod.GET)`. It can also take a `value` argument to specify a URI segment such as `@GetMapping("/secured")`. This `@GetMapping` will handle HTTP GET requests to the `/secured` URI by returning a view called `secured`. In Spring MVC when a `@Controller` class' method returns a String it attempts to find a view with the returned name. 

The `Model` argument to our method is a Spring MVC model. This is the glue between our Model and Spring. Spring automatically passes a Model object when it sees a Controller method with a `Model` argument. We don't have to do this ourselves. The `Model` is effectively a `Map<String, Object` which we can store data behind keys to be sent to the View. In this case we are adding a single key: `username` which will store the username that is retrieved from the Principal.


**2. Add a SecurityConfig**

Click on the following link which will open `SecurityConfig.java` file in the editor: ``src/main/java/com/example/service/SecurityConfig.java``{{open}}

This class utilizes the Keycloak Spring Security Adapter that’s included in the Spring Boot Keycloak Starter dependency to integrate Keycloak with Spring Security. Keycloak provides the `KeycloakWebSecurityConfigurerAdapter` class as a convenient base class for creating a `WebSecurityConfigurer` instance, which is required for any application secured by Spring Security. The implementation allows customization by overriding methods. While its use is not required, it greatly simplifies security context configuration.

Add the below content to the matching `// TODO: configure` statement (or use the `Copy to Editor` button):

<pre class="file" data-filename="src/main/java/com/example/service/SecurityConfig.java" data-target="insert" data-marker="// TODO: configure">
http.authorizeRequests()
    .antMatchers("/secured*")
    .hasRole("user")
    .anyRequest()
    .permitAll();
</pre>

The configure method is used here to secure specific endpoints. In this case, `.antMatchers("/secured*").hasRole("user")` requires that access to the `“/secured”` route will only be authorized if the one requesting it has authenticated with `Keycloak` and has the role `“user”`.

## Congratulations

You have now learned how to how to create simple Spring MVC Controller and how to connect your Model to the View using a Controller. In the next section we'll review the Views we've created for you.