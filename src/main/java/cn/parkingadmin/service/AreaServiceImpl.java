package cn.parkingadmin.service;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.repository.AreaRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/31.
 */
@Service("areaService")
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaRepository areaRepository;

    @Override
    public Page<Area> findList(Long areaId, Pageable pageable) {
        Page<Area> pageBean = null;
        if (areaId == 0) {
            pageBean = areaRepository.findAll(pageable);
        } else {
            pageBean = areaRepository.findById(areaId, pageable);
        }
        return pageBean;
    }

    @Override
    public List<Area> findAll() {
        return areaRepository.findAll();
    }
}
