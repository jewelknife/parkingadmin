package cn.parkingadmin.web;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.service.AreaService;
import cn.parkingadmin.service.FeesService;
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
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/31.
 */
@Controller
public class AreaController {

    private static Logger logger = Logger.getLogger(AreaController.class);

    @Value("${parkingadmin.pagesize}")
    private int PAGE_LIMIT = 10;

    @Autowired
    private AreaService areaService;
    @Autowired
    private FeesService feesService;
    @Autowired
    private UserService userService;

    @RequestMapping(value="/area/list", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Area> listWithJson( @RequestParam(defaultValue = "0", required = false) String page, @RequestParam(defaultValue = "0", required = false) Long area_id) {
        return this.getPageBean(page, area_id);
    }

    @RequestMapping(value="/area/all", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Area> allListWithJson() {
        return areaService.findAll();
    }

    @RequestMapping(value="/area/list", produces = MediaType.TEXT_HTML_VALUE)
    public String list( @RequestParam(defaultValue = "0", required = false) String page, @RequestParam(defaultValue = "0", required = false) Long area_id, ModelMap model) {
        model.put("pageBean", this.getPageBean(page, area_id));
        return "/area/area";
    }

    @RequestMapping(value="/area/q", produces = MediaType.TEXT_HTML_VALUE)
    public String qryList( @RequestParam(defaultValue = "0", required = false) String page , @RequestParam(defaultValue = "0", required = false) Long area_id, ModelMap model) {
        this.list(page, area_id, model);
        return "/area/_list";
    }

    @RequestMapping(value="/admin/area", produces = MediaType.TEXT_HTML_VALUE)
    public String areaAdminList(@RequestParam(defaultValue = "0", required = false) String page, @RequestParam(defaultValue = "0", required = false) Long area_id, ModelMap model) {
        this.list(page, area_id, model);
        return "/admin/admin_area";
    }

    @RequestMapping(value="/admin/area/q", produces = MediaType.TEXT_HTML_VALUE)
    public String qryAdminList( @RequestParam(defaultValue = "0", required = false) String page , @RequestParam(defaultValue = "0", required = false) Long area_id, ModelMap model) {
        this.list(page, area_id, model);
        return "/admin/admin_area_list";
    }

    @RequestMapping(value="/admin/area/save", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap _save(Area form) {
        Area area = null;
        boolean isNew = form.getId() == null || form.getId() == 0;
        ModelMap modelMap = new ModelMap();
        try {
            area = areaService.save(form);
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
        }
        if (area == null) {
            modelMap.addAttribute("msg", "Save fail!");
        } else {
            modelMap.addAttribute("msg", "success");
            area.setManager(userService.findOne(area.getAreaManagerId()));
            modelMap.addAttribute("area", area);
        }
        return modelMap;
    }

    @RequestMapping(value="/admin/area/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ModelMap delete(@PathVariable long id) {
        ModelMap modelMap = new ModelMap();
        try {
            if (feesService.isFeesInArea(id)) {
                modelMap.addAttribute("msg", "Delete fail! Area id in used.");
                modelMap.addAttribute("errCode", "WC0022");
            } else {
                areaService.delete(id);
                modelMap.addAttribute("msg", "success");
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
            modelMap.addAttribute("msg", "Save fail!");
            modelMap.addAttribute("errCode", "WC0099");
        }
        return modelMap;
    }

    @RequestMapping(value="/admin/area/del", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap delete(@RequestParam(value = "area_checked") long[] ids) {
        ModelMap modelMap = new ModelMap();
        try {
            for (long id : ids) {
                if (feesService.isFeesInArea(id)) {
                    modelMap.addAttribute("msg", "Delete fail! Area id in used.");
                    modelMap.addAttribute("errCode", "WC0022");
                    modelMap.addAttribute("areaId", id);
                    return modelMap;
                }
            }
            areaService.delete(ids);
            modelMap.addAttribute("msg", "success");
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
            modelMap.addAttribute("msg", "Delete fail!");
            modelMap.addAttribute("errCode", "WC0099");
        }
        return modelMap;
    }

    private Page<Area> getPageBean(String page, Long areaId) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.ASC, "id");
        return areaService.findList(areaId, pageRequest);
    }

}
