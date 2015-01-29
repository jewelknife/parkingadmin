package cn.parkingadmin.service;

import cn.parkingadmin.domain.Fees;
import cn.parkingadmin.repository.FeesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by jewelknife on 2015/1/29.
 */
@Service("feesService")
public class FeesServiceImpl implements FeesService {

    @Autowired
    private FeesRepository feesRepository;

    @Override
    public Page<Fees> findList(int areaId, String userCode, Pageable pageable) {
        Page<Fees> pageBean = null;
        if (!"all".equalsIgnoreCase(userCode) && areaId > 0) {
            pageBean = feesRepository.findByAreaIdAndUserCode(areaId, userCode, pageable);
        } else if (!"all".equalsIgnoreCase(userCode)) {
            pageBean = feesRepository.findByUserCode(userCode, pageable);
        } else if (areaId > 0) {
            pageBean = feesRepository.findByAreaId(areaId, pageable);
        } else {
            pageBean = feesRepository.findAll(pageable);
        }
        return pageBean;
    }
}
