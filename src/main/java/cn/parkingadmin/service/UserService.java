package cn.parkingadmin.service;

import cn.parkingadmin.domain.User;

/**
 * Created by jewelknife on 2015/1/20.
 */
public interface UserService {

    User findByUsername(String username);

//    User findByUsernameAndPassword(String username, String password);

    User save(User user);

    User findOne(Long id);

}
