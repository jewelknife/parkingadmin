package cn.parkingadmin.service;

import cn.parkingadmin.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Created by jewelknife on 2015/1/20.
 */
public interface UserService {

    Page<User> findAll(Pageable pageable);

    User findByUsername(String username);

//    User findByUsernameAndPassword(String username, String password);

    User save(User user);

    User findOne(Long id);

}
