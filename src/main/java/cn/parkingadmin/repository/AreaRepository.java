package cn.parkingadmin.repository;

import cn.parkingadmin.domain.Area;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by jewelknife on 2015/1/29.
 */
public interface AreaRepository extends Repository<Area, Long> {

    Area findOne(Long areaId);

    List<Area> findAll();

    Page<Area> findAll(Pageable pageable);

    Page<Area> findById(Long areaId, Pageable pageable);

    Page<Area> findByAreaManagerId(Long areaManagerId, Pageable pageable);

    Area save(Area area);

    void delete(Long id);

}
