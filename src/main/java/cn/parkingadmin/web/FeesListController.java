package cn.parkingadmin.web;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.domain.Fees;
import cn.parkingadmin.service.FeesService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/29.
 */
@Controller
@RequestMapping("/fees/*")
public class FeesListController {

    @Value("${parkingadmin.pagesize}")
    private int PAGE_LIMIT = 10;

    @Autowired
    private FeesService feesService;

    private Page<Fees> getPageBean(String page, int areaId, String userCode) {
        int pageInt = 0;
        if (StringUtils.isNumeric(page) && Integer.parseInt(page) > 0) {
            pageInt = Integer.parseInt(page) - 1;
        }
        Pageable pageRequest = new PageRequest(pageInt, PAGE_LIMIT, Sort.Direction.DESC, "id");
        return feesService.findList(areaId, userCode, pageRequest);
    }

    @RequestMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Fees> listWithJson(
            @RequestParam(defaultValue = "0", required = false) String page
            , @RequestParam(defaultValue = "all", required = false) String user_code
            , @RequestParam(defaultValue = "0",  required = false) Integer area_id) {
        return this.getPageBean(page, area_id, user_code);
    }

    @RequestMapping(value="/list", produces = MediaType.TEXT_HTML_VALUE)
    public ModelAndView list(
              @RequestParam(defaultValue = "0", required = false) String page
            , @RequestParam(defaultValue = "all", required = false) String user_code
            , @RequestParam(defaultValue = "0",  required = false) Integer area_id) {
        ModelAndView modelAndView = new ModelAndView("/fees/list");
        modelAndView.getModel().put("pageBean", this.getPageBean(page, area_id, user_code));
        return modelAndView;
    }

}
