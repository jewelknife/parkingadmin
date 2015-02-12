package cn.parkingadmin.repository;

import cn.parkingadmin.domain.Fees;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

/**
 * Created by jewelknife on 2015/1/29.
 */
public interface FeesRepository extends Repository<Fees, Long> {

    Page<Fees> findAll(Pageable pageable);

    Page<Fees> findByAreaId(long areaId, Pageable pageable);

    Page<Fees> findByUserCode(String userCode, Pageable pageable);

    Page<Fees> findByAreaIdAndUserCode(long areaId, String userCode, Pageable pageable);

}
