package com.bluesoft.associations.management.config;

import com.bluesoft.associations.management.entities.User;
import com.bluesoft.associations.management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class SuccessAuthenticationHandler implements AuthenticationSuccessHandler {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService adminUserService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String username = (String) authentication.getPrincipal();
        if (username != null && !username.isEmpty()) {
            session.setAttribute("userName", username);
            User user = adminUserService.findByUsername(username);
            session.setAttribute("LoggedInUser", user);
            RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
            redirectStrategy.sendRedirect(request, response, "/app");
        }
    }
}
