package com.bluesoft.associations.management.controller;

import com.bluesoft.associations.management.entities.Role;
import com.bluesoft.associations.management.entities.User;
import com.bluesoft.associations.management.service.RoleService;
import com.bluesoft.associations.management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public abstract class BaseController {

    public static final String LOGGED_IN_USER_SESSION_ATTR = "LoggedInUser";

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    public static HttpSession getSession() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true); // true == allow create
    }

    protected User getLoggedInUser() {
        String username = (String) getSession().getAttribute("userName");
        User loggedUser = (User) getSession().getAttribute(LOGGED_IN_USER_SESSION_ATTR);
        if (loggedUser == null) {
            loggedUser = userService.findByUsername(username);
            getSession().setAttribute(LOGGED_IN_USER_SESSION_ATTR, loggedUser);
        }
        return loggedUser;
    }

    protected List<Role> getLoggedInUserRoles() {
        return roleService.getUserRoles(getLoggedInUser().getId());
    }

    protected boolean isUserHasRole(String roleName) {
        List<Role> roles = getLoggedInUserRoles();
        for (Role role : roles) {
            if (role.getName().equals(roleName)) {
                return true;
            }
        }
        return false;
    }
}
