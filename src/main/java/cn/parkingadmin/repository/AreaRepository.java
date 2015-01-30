package cn.parkingadmin.repository;

import cn.parkingadmin.domain.Area;
import cn.parkingadmin.domain.Fees;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.Repository;

/**
 * Created by jewelknife on 2015/1/29.
 */
public interface AreaRepository extends Repository<Area, Long> {

    Page<Area> findAll(Pageable pageable);

    Page<Area> findByAreaCode(String areaCode, Pageable pageable);

}
