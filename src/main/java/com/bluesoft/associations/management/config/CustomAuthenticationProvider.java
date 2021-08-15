package com.bluesoft.associations.management.config;

import com.bluesoft.associations.management.entities.User;
import com.bluesoft.associations.management.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    private Logger logger = LogManager.getLogger(CustomAuthenticationProvider.class);

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        List<GrantedAuthority> authorities = null;

        if (name != null && password != null && !name.isEmpty() && !password.isEmpty()) {
            User user = userService.findByUsername(name);
            if (user != null  /*&& user.getUserEnabled().equals(true) && user.getDeleted().equals(false)*/) {
                if (password.equals(user.getPassword())) {
                    return new UsernamePasswordAuthenticationToken(name, user.getPassword(), getUserAuthorities(user));
                }
                throw new UsernameNotFoundException(name);
            }
        }
        return null;
    }

    private List<GrantedAuthority> getUserAuthorities(User user) {
        if (user != null) {
            return user.getUserRoles().stream().map(userRole -> (GrantedAuthority) userRole.getRole()::getName).collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
    }
}
