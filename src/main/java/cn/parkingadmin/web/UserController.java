package cn.parkingadmin.web;

import cn.parkingadmin.domain.User;
import cn.parkingadmin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/31.
 */
@Controller
public class UserController {

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
        return "/admin/user_list";
    }

    private Page<User> getPageBean(String page) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.DESC, "id");
        return userService.findAll(pageRequest);
    }

    @RequestMapping(value="/user/list", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<User> listWithJson() {
        return userService.findAll();
    }

}
