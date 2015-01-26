/*
 *  @(#)HomeController.java    1.3 1/21/15
 *  Copyright © 2014 Vobile, Inc. All rights reserved.
 */
package cn.parkingadmin.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author jewelknife on 2015/1/20.
 */
@Controller
public class IndexController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String none() {
        return "redirect:/login";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String home() {
        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello() {
        return "hi , test is a test.";
    }

}
