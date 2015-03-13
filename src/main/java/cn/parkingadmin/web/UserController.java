package cn.parkingadmin.web;

import cn.parkingadmin.domain.Role;
import cn.parkingadmin.domain.User;
import cn.parkingadmin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/31.
 */
@Controller
public class UserController {

    private static Logger logger = Logger.getLogger(AreaController.class);

    @Value("${parkingadmin.pagesize}")
    private int PAGE_LIMIT = 10;

    @Autowired
    private UserService userService;

    @RequestMapping(value="/admin/user", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<User> listWithJson(
            @RequestParam(defaultValue = "0", required = false) String page) {
        return this.getPageBean(page);
    }

    @RequestMapping(value="/admin/user", produces = MediaType.TEXT_HTML_VALUE)
    public String list(
            @RequestParam(defaultValue = "0", required = false) String page
            , ModelMap model) {
        model.put("pageBean", this.getPageBean(page));
        model.put("roleList", userService.findAllRole());
        return "/admin/user_list";
    }

    @RequestMapping(value="/admin/user/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User getOne(
            @PathVariable long id) {
        return userService.findOne(id);
    }

    @RequestMapping(value="/user/changePasswd", method= RequestMethod.PUT)
    @ResponseBody
    public void changePasswd(@RequestParam(required = true) String oripasswd
            , @RequestParam(required = true) String newpasswd
            , @RequestParam(required = true) String renewpasswd
//            , @(required = true) String renewpasswd
            , ModelMap model) {
        SecurityContextHolder.getContext().getAuthentication();
        if (!newpasswd.equals(renewpasswd)) {
            model.put("msg", "newpasswd not equal repasswd!");
            model.put("error_code", "WC0031");
        } else {
        }
    }

    @RequestMapping(value="/admin/user/save", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap _save(User form) {
        User user = null;
        ModelMap modelMap = new ModelMap();
        try {
            user = userService.save(form);
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
        }
        if (user == null) {
            modelMap.addAttribute("msg", "Save fail!");
        } else {
            modelMap.addAttribute("msg", "success");
//            area.setManager(userService.findOne(area.getAreaManagerId()));
            modelMap.addAttribute("user", user);
        }
        return modelMap;
    }

    @RequestMapping(value="/admin/user/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ModelMap delete(@PathVariable long id) {
        ModelMap modelMap = new ModelMap();
        try {
            User user = userService.findOne(id);
            if (user == null) {
                modelMap.addAttribute("msg", "Delete fail! User is not exists.");
                modelMap.addAttribute("errCode", "WC0033");
            } else if (userService.isUserInUse(user)) {
                modelMap.addAttribute("msg", "Delete fail! User in used.");
                modelMap.addAttribute("errCode", "WC0032");
            } else {
                userService.delete(id);
                modelMap.addAttribute("msg", "success");
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
            modelMap.addAttribute("msg", "Delete fail!");
            modelMap.addAttribute("errCode", "WC0099");
        }
        return modelMap;
    }

    @RequestMapping(value="/admin/user/del", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap delete(@RequestParam(value = "user_checked") long[] ids) {
        ModelMap modelMap = new ModelMap();
        try {
            for (long id : ids) {
                User user = userService.findOne(id);
                if (user != null && userService.isUserInUse(user)) {
                    modelMap.addAttribute("msg", "Delete fail! User in used.");
                    modelMap.addAttribute("errCode", "WC0032");
                    modelMap.addAttribute("userId", id);
                    return modelMap;
                }
            }
            userService.delete(ids);
            modelMap.addAttribute("msg", "success");
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
            modelMap.addAttribute("msg", "Delete fail!");
            modelMap.addAttribute("errCode", "WC0099");
        }
        return modelMap;
    }

    private Page<User> getPageBean(String page) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.DESC, "id");
        return userService.findAll(pageRequest);
    }

    @RequestMapping(value="/user/all", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<User> userlist() {
        return userService.findAll();
    }

    @RequestMapping(value="/role/all", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Role> rolelist() {
        return userService.findAllRole();
    }

}
