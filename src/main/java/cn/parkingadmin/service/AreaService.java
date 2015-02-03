package cn.parkingadmin.service;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.domain.Fees;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/29.
 */
public interface AreaService {

    Page<Area> findList(String areaCode, Pageable pageable);

    List<Area> findAll();

}
