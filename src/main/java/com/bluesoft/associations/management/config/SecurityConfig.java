package com.bluesoft.associations.management.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final String INITIALIZE_USER = "/user";
    private final String INVITATION_REQUEST = "/invitation";
    private final String INVITATION_REGISTER = "/invitation/register/**";
    private final String CHANGE_PASSWORD = "/password/change";



    private String [] getPublicPathArray = {INVITATION_REGISTER,INVITATION_REQUEST, INITIALIZE_USER};
    private String [] postPublicPathArray = {INVITATION_REGISTER,INVITATION_REQUEST};


    @Autowired
    CustomAuthenticationProvider authProvider;

    @Autowired
    SuccessAuthenticationHandler successAuthenticationHandler;

    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }

    @Bean
    GrantedAuthorityDefaults grantedAuthorityDefaults() {
        return new GrantedAuthorityDefaults(""); // Remove the ROLE_ prefix
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers(HttpMethod.GET,getPublicPathArray).permitAll()
                .antMatchers(HttpMethod.POST,postPublicPathArray).permitAll()
                .antMatchers("/app/**").hasAnyRole("ADMIN","OWNER","EMPLOYEE","MANAGER")
                .and()
                .formLogin()
                .loginPage("/login")
                .successHandler(successAuthenticationHandler)
                .failureHandler(getFailureHandler())
                .and()
                .logout()
                .logoutUrl("/j_spring_security_logout")
                .logoutSuccessUrl("/login?logout=Successfully logged out");
    }


    @Bean
    public AuthenticationFailureHandler getFailureHandler() {
        SimpleUrlAuthenticationFailureHandler handler = new SimpleUrlAuthenticationFailureHandler();
        handler.setDefaultFailureUrl("/login?error=wrong user name or password");
        return handler;
    }


  /*  @Bean
    CorsConfigurationSource corsConfigurationSource() {
        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", new CorsConfiguration().applyPermitDefaultValues());
        return source;
    }*/


}
