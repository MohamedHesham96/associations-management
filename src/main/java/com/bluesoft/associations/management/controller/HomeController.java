package com.bluesoft.associations.management.controller;

import com.bluesoft.associations.management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller
public class HomeController extends BaseController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/error")
    public ModelAndView error() {
        return new ModelAndView("common/404");
    }

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout,
                              @RequestParam(value = "success", required = false) String success,
                              HttpServletRequest request) {

        ModelAndView login = new ModelAndView("login");
        if (success != null) {
            login.addObject("successMsg", success);
        }
        if (error != null) {
            login.addObject("error", error);
        }

        if (logout != null) {
            login.addObject("msg", logout);
        }

        return login;

    }

    @GetMapping("/app/**")
    public String Home(HttpServletRequest request, HttpServletResponse response) {
        getLoggedInUser();
        prepareDefaultLocale(request);
        return "redirect:/app/helps";
    }

    private void prepareDefaultLocale(HttpServletRequest request) {
        Locale englishLocale = new Locale("en");
        WebUtils.setSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, englishLocale);
        request.getSession().setAttribute("currentLocale", englishLocale);
    }
}
