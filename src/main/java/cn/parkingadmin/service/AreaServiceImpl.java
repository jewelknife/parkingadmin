package cn.parkingadmin.service;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.repository.AreaRepository;
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
    public Page<Area> findList(String areaCode, Pageable pageable) {
        Page<Area> pageBean = null;
        if ("all".equalsIgnoreCase(areaCode)) {
            pageBean = areaRepository.findAll(pageable);
        } else {
            pageBean = areaRepository.findByAreaCode(areaCode, pageable);
        }
        return pageBean;
    }

    @Override
    public List<Area> findAll() {
        return areaRepository.findAll();
    }
}
