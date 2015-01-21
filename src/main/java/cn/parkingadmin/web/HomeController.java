/*
 *  @(#)HomeController.java    1.3 1/21/15
 *  Copyright © 2014 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author <A HREF="mailto:chen_yingbo@vobile.cn">Yingbo Chen</A>
 * @version 1.3 1/21/15
 * @since 1.3
 */
@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String none() {
        return "redirect:/login/login";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

}
