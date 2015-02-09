package cn.parkingadmin.web;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.service.AreaService;
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
    public String _new(Area form,Model model) {
        Area area = null;
        try {
            area = areaService.save(form);
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
        }
        if (area == null) {
            model.addAttribute("msg", "Save fail!");
        } else {
            model.addAttribute("msg", "sucess");
        }
        return null;
    }

    @RequestMapping(value="/admin/area/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@PathVariable long id, Model model) {
        try {
            areaService.delete(id);
            model.addAttribute("msg", "sucess");
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
            model.addAttribute("msg", "Save fail!");
        }
        return null;
    }

    private Page<Area> getPageBean(String page, Long areaId) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.DESC, "id");
        return areaService.findList(areaId, pageRequest);
    }

}
