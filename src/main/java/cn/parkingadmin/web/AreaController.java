package cn.parkingadmin.web;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.service.AreaService;
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
public class AreaController {

    @Value("${parkingadmin.pagesize}")
    private int PAGE_LIMIT = 10;

    @Autowired
    private AreaService areaService;

    @RequestMapping(value="/area/list", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Area> listWithJson(
            @RequestParam(defaultValue = "0", required = false) String page
            , @RequestParam(defaultValue = "all", required = false) String area_code) {
        return this.getPageBean(page, area_code);
    }

    @RequestMapping(value="/area/all", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Area> allListWithJson() {
        return areaService.findAll();
    }

    @RequestMapping(value="/area/list", produces = MediaType.TEXT_HTML_VALUE)
    public String list(
            @RequestParam(defaultValue = "0", required = false) String page
            , @RequestParam(defaultValue = "all", required = false) String areaCode, ModelMap model) {
        model.put("pageBean", this.getPageBean(page, areaCode));
        return "/area/list";
    }

    @RequestMapping(value="/admin/area", produces = MediaType.TEXT_HTML_VALUE)
    public String areaAdminList(
            @RequestParam(defaultValue = "0", required = false) String page
            , @RequestParam(defaultValue = "all", required = false) String areaCode, ModelMap model) {
        this.list(page, areaCode, model);
        return "/admin/area_list";
    }

    private Page<Area> getPageBean(String page, String areaCode) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.DESC, "id");
        return areaService.findList(areaCode, pageRequest);
    }

}
