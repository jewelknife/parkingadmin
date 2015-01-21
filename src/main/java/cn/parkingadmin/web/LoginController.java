package cn.parkingadmin.web;

import cn.parkingadmin.domain.User;
import cn.parkingadmin.repository.UserRepository;
import cn.parkingadmin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by jewelknife on 2015/1/20.
 */
@Controller
@RequestMapping("/login/*")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void getLogin() {
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User userform, Model model, HttpSession session) {
//        User user = userService.findByUsername(userform.getUsername());
//        if (user == null) {
//            model.addAttribute("errorMsg", "User is not existst !");
//            return null;
//        }
//        user = userService.findByUsernameAndPassword(userform.getUsername(), userform.getPassword());
//        if (user == null) {
//            model.addAttribute("errorMsg", "Password is not correctly !");
//            return null;
//        }
//        session.setAttribute("loginUser", user);
        User user = new User("admin", "aaaa", "adb@aa.com");
        user.setId(1l);
        session.setAttribute("loginUser", user);
        return "redirect:/home";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.setAttribute("loginUser", null);
        return "redirect:/home";
    }
}


