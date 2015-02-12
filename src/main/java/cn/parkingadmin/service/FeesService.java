package cn.parkingadmin.service;

import cn.parkingadmin.domain.Fees;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Created by jewelknife on 2015/1/29.
 */
public interface FeesService {

    Page<Fees> findList(long areaId, String userCode, Pageable pageable);

    boolean isFeesInArea(long areaId);

}
